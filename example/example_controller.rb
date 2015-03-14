require './lib/vicon'

class ExampleController < Vicon::Controller
  def call
    context.item = OpenStruct.new(context.data)
  end

  def validate
    context.fail!(error: "You need to specify data.") unless context.data
  end
end
