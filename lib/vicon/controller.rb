require 'interactor'

module Vicon
  module Controller

    def self.included(base)
      base.class_eval do
        include Interactor
        include InstanceMethods
        extend ClassMethods

        before do 
          self.class.validate(context)
        end

        around do |interactor|
          if context.success?
            interactor.call
          end
        end
      end
    end

    module InstanceMethods
    end

    module ClassMethods
      def validators
        @validators ||= []
      end

      def validate(context)
        validators.each do |validator|
          context.fail! if context[validator].nil?
        end
      end

      def validate_input(key)
        validators << key
      end
    end
  end
end
