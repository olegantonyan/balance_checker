require 'rubygems'
require 'active_support/inflector'
Dir["#{File.dirname(__FILE__)}/#{File.basename(__FILE__, '.*')}/*.rb"].each {|file| require file }

module Notifiers
  AVAILABLE = self.constants.select {|c| self.const_get(c).is_a? Class}.map{|c| c.to_s.underscore }

  def self.by_name(str)
    raise ArgumentError, "no such notifier #{str}" unless AVAILABLE.include?(str)
    "#{self.to_s}::#{str.classify}".constantize
  end

end
