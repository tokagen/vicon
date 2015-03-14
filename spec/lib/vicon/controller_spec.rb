require 'vicon/controller'
require 'vicon/context'

describe Vicon::Controller do
  subject { described_class.call(context) }
  let(:context) { Vicon::Context.build }

  context 'with valid context' do
    it 'succeedes' do
      expect(subject).to be_success
    end
  end

  context 'with failing context' do
    it 'fails' do
      expect(subject).to be_failure
    end
  end
end
