require 'interactor'

module Vicon
  class Organizer
    include Interactor::Organizer

    def self.chain(*controllers)
      self.tap do |interactor|
        organize(*controllers)
      end
    end
  end
end
