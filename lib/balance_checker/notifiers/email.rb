module Notifiers
  class Email
    attr_reader :name

    def initialize(options = {})
      @name = options.fetch(:name, nil)
      raise ArgumentError, "no config for notifier #{self.class}" unless @name
    end

    def deliver msg
      puts "Notification: #{msg}"
    end
  end
end
