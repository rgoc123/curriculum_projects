require_relative 'card'
require 'byebug'

class Deck

  def initialize
    @deck = Array.new
    populate
  end 
  
  def length
    deck.length
  end 
  
  def deal
    deck.pop
  end 
  
  private
  attr_accessor :deck
  
  def populate

    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        # debugger
        deck << Card.new(value, suit)
        # debugger
      end 
    end 
  end 
  
  def shuffle
    deck.shuffle!
  end 
  
end