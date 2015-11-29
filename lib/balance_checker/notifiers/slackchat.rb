require 'slack-notifier'

module Notifiers
  class Slackchat
    attr_reader :name, :config

    def initialize(options = {})
      @name = options.fetch(:name) { raise ArgumentError, "no config for notifier #{self.class}" }
      @config = options.fetch(:config)
      @webhook_url = config.fetch(:webhook_url)
      @channel = config.fetch(:channel)
      @icon_emoji = config.fetch(:icon_emoji, ':trollface:')
    end

    def deliver msg
      client = Slack::Notifier.new(webhook_url, username: username, channel: channel, icon_emoji: icon_emoji)
      puts "Sending slack notification to #{channel}"
      client.ping(msg)
    end

    private

    attr_reader :webhook_url, :channel, :icon_emoji

    def username
      self.class.name
    end

  end
end
