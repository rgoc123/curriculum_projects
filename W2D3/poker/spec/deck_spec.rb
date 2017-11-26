require 'deck'

describe Deck do 
  
  subject(:test_deck) { Deck.new }
  
  describe "#initialize" do 
    it "should initialize with an array" do
      expect(test_deck.send(:deck)).to be_an_instance_of(Array)
    end
    it "the deck should have 52 elements of Card class" do
      expect(test_deck.length).to eq(52)
    end
    
  end 
  
  describe "#shuffle" do
    it "should shuffle Deck" do
      sorted_deck = test_deck.send(:deck)
      expect(test_deck.send(:shuffle)).not_to eq(sorted_deck)
    end
    
  end
  
  describe "#deal" do
    it "should deal 1 card" do
      example_deck = test_deck.send(:deck)
      expect(test_deck.send(:deck).deal).to eq(example_deck.last)
      
    end
    
    it "should update your deck" do
      original_deck = test_deck.send(:deck)
      test_deck.deal
      expect(test_deck.length).to eq(original_deck.length + 1)
    end
  end
  
  
end 