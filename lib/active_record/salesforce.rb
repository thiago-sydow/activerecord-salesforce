require_relative 'salesforce/version'
require 'active_support'
require 'databasedotcom'
require 'yaml'

module ActiveRecord
  module Salesforce
    module Base

      def self.included(base)
        base.extend(ClassMethods)
      end

      def save_in_salesforce(config = nil)
        raise ConfigFileMissing unless config

        logger = Logger.new(STDOUT)

        client = Databasedotcom::Client.new config

        begin
          client.authenticate username: config[:username], password: config[:password]
        rescue
          raise UserNotAuthenticable
        end

        @owner_id   = client.user_id
        model = client.materialize(self.class.sobject.to_s).new

        self.class.maped.each_pair do |key, value|
          model[key.to_s] = instance_variable_get("@#{value}")
          model[key.to_s] = attributes[value.to_s] if (self.respond_to?(:attributes) && model[key.to_s].nil?)
        end

        begin
          model.save
          return true
        rescue Exception => e
          logger.error(e)
          return false
        end

      end

      module ClassMethods
        attr_accessor :sobject, :maped

        def salesforce_object(sobject)
          @sobject = sobject
        end

        def map_attribute(salesforce_attr, actual_attr)
          @maped ||= {}
          @maped[salesforce_attr] = actual_attr
        end
      end

      class ConfigFileMissing < StandardError; end
      class UserNotAuthenticable < StandardError; end
    end
  end
end
