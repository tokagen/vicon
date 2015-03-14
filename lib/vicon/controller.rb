require 'interactor'
module Vicon
  class Controller
    include Interactor
    def self.inherited(controller)
      controller.class_eval do
        before do
          validate if self.respond_to?(:validate)
        end

        around do |interactor|
          if context.success?
            interactor.call
          end
        end
      end
    end
  end
end
