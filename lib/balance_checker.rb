require 'balance_checker/version'
require 'balance_checker/providers'
require 'balance_checker/notifiers'
require 'active_support/core_ext/hash/keys.rb'
require 'monkey_patches'
require 'yaml'

module BalanceChecker
  @config = {}

  def self.config
    @config
  end

  def self.configure(opts = {})
    opts.each {|k,v| @config[k.to_sym] = v }
  end

  def self.configure_with(path_to_yaml_file)
    begin
      config = YAML::load(IO.read(path_to_yaml_file))
    rescue Errno::ENOENT
      warn("YAML configuration file couldn't be found. Using defaults"); return
    rescue Psych::SyntaxError
      warn("YAML configuration file contains invalid syntax. Using defaults"); return
    end
    configure(config.deep_symbolize_keys)
  end

  def self.run!
    config[:providers].each do |prov|
      provider = Providers.by_config(prov)
      balance = provider.check
      message = "#{provider.class.to_s} balance is #{balance}"
      puts message
      notify(message) if notify?(balance)
    end
  end

  private

  def self.notify?(balance)
    balance < config.fetch(:threshold, 30)
  end

  def self.notify message
    config[:notifiers].each do |noti|
      Notifiers.by_config(noti).deliver(message)
    end
  end

end
