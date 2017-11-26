class Card
  VALUES = %w{2 3 4 5 6 7 8 9 10 J Q K A}
  SUITS = [:club, :diamond, :heart, :spade]
  
  attr_reader :value, :suit
  
  def initialize(value, suit)
    @value = value
    @suit = suit
  end
  
end