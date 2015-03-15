require 'spec_helper'
require 'vicon/controller'
require 'vicon/context'

describe Vicon::Controller do
  subject do
    class Foo
      include Vicon::Controller
    end
    Foo.call(context)
  end
  let(:context) { Vicon::Context.build(context_params) }
  let(:context_params) { {} }

  context 'with valid context' do
    include_examples 'success'
  end

  context 'with failing context' do
    before(:each) { context.fail! rescue false }
    include_examples 'failure'
  end

  context 'with validations' do
    subject do
      class Foo 
        include Vicon::Controller
        validate_input :test
      end

      Foo.call(context)
    end

    context 'without params' do
      include_examples 'failure'
    end

    context 'with params' do
      let(:context_params) { { test: [] } }
      include_examples 'success'
    end
  end
end
