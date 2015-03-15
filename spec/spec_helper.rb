shared_examples 'failure' do
  it 'fails' do
    expect(subject).to be_failure
  end
end

shared_examples 'success' do
  it 'succeedes' do
    expect(subject).to be_success
  end
end
