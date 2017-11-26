require 'card'

describe Card do
  subject(:ace) { Card.new('A', :club) }
  
  describe '#initialize' do
    
    it 'should have a valid value' do
      expect(ace.value).to eq("A")
    end

    it 'should have a valid suit' do
      expect(ace.suit).to eq(:club)
    end
    
  end
end