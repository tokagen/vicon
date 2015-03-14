require './example/example_organizer'

describe ExampleOrganizer do
  subject { described_class.chain(controllers).call(context) }
  let(:controllers) { [FirstController, SecondController] }
  let(:context) { Vicon::Context.build(context_params) }
  let(:context_params) { { number: 10 } }

  context 'with valid data' do
    it 'succeedes' do
      expect(subject).to be_success
    end

    it 'provides correct data' do
      expect(subject.number).to be(110)
    end
  end

  context 'without valid data' do
    let(:context_params) { nil }
    it 'fails' do
      expect(subject).to be_failure
    end
  end

  context 'with only one interactor' do
    let(:controllers) { FirstController }
    it 'succeedes' do
      expect(subject).to be_success
    end

    it 'provides correct data' do
      expect(subject.number).to be(11)
    end
  end
end
