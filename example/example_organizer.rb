require './lib/vicon'

class ExampleOrganizer < Vicon::Organizer
  
end

class FirstController < Vicon::Controller
  def call
    context.number = context.number.to_i + 1
  end

  def validate
    context.fail!(error: "You need to provide a number") unless context.number
  end
end

class SecondController < Vicon::Controller
  def call
    context.number = context.number * 10
  end

  def validate
    context.fail!(error: "You need to provide a number") unless context.number
  end
end
