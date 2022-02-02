require './corrector'

describe Corrector do
  before :each do
    @corrector = Corrector.new
  end

  it 'should correct the name' do
    expect(@corrector.correct_name('test')).to eq 'Test'
    expect(@corrector.correct_name('testtestte')).to eq 'Testtestte'
    expect(@corrector.correct_name('testtesttest')).to eq 'Testtestte'
  end
end
