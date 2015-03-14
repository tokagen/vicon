require './example/example_controller'

describe ExampleController do
  subject { described_class.call(context) }
  let(:context) { Vicon::Context.build(data: data_param) }
  let(:data_param) { 
    OpenStruct.new(
      foo: :bar,
      bar: :baz
    )
  }

  context 'with valid context' do
    it 'succeedes' do
      expect(subject).to be_success
    end
  end

  context 'with invalid context' do
    let(:data_param) { nil }
    it 'fails' do
      expect(subject).to be_failure
    end
  end
end
