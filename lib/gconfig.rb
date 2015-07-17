# encoding: utf-8

##
## configuration.rb
## Gaetan JUVIN 16/07/2015
##

require "gconfig/version"

#### Configuration module

# require 'gconfig'
#
# module MyModule
# 	extend GConfig
# 	default mailer_sender: 'toto@example.com', age: 3
# 	default name: 'Nicolas'
# 	default last_name: 'Dulac'
# 	...
# end
#
# MyModule.config do |config|
#   config.mailer_sender = 'donotreply@example.com'
# end
#
# puts MyModule.config.mailer_sender
# puts MyModule.config.age

module GConfig
  def config
    @config ||= Configuration.new
    yield @config if block_given?
    @config
  end

  def default(*args)
    args.each do |arg|
      raise 'default :key => :value' unless arg.is_a?(Hash)
      arg.each do |key, value|
        self.config.generate_parameters(key, value)
      end
    end
  end

  class Configuration
    # Generate automatically instance variable for any parameters
    def generate_parameters(name, value)
      self.instance_variable_set("@#{name}", value)
      self.class.send(:attr_accessor, name)
    end
  end
end
