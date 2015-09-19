require 'net/smtp'

module Notifiers
  class Email
    attr_reader :name, :config, :to, :from

    def initialize(options = {})
      @name = options.fetch(:name, nil)
      raise ArgumentError, "no config for notifier #{self.class}" unless @name
      @config = options.fetch(:config)
      @to = config[:to]
      @from = config[:smtp][:user_name]
    end

    def deliver msg
      message = <<-MESSAGE
      From: #{from}
      To: #{to}
      Subject: #{msg}

      #{msg}
      MESSAGE

      if config[:smtp]
        puts "Sending email to #{to}"
        smtp = Net::SMTP.new(config[:smtp][:address], config[:smtp][:port])
        smtp.enable_starttls if config[:smtp][:enable_starttls_auto]
        smtp.start(config[:smtp][:user_name].split('@')[1], config[:smtp][:user_name],  config[:smtp][:password],  config[:smtp][:authentication])
        smtp.send_message(message, from, to)
        smtp.finish
      end
    end
  end
end
