require_relative 'player.rb'
ALPHABET = ('a'..'z').to_a

class Ghost
  attr_reader :players, :dictionary

  def initialize(dictionary, players)
    @players = players
    @dictionary = dictionary
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players.rotate(1)
  end

  def take_turn(@current_player)
    fragment = @current_player.guess
    until valid_move?(@current_player.guess)
      fragment = @current_player.guess
    end
    

  end

  def valid_move?(string)
    if ALPHABET.include?(string.downcase)

    end
  end

  def play_round
    until valid_move?
  end

end

if __FILE__ == $PROGRAM_NAME
  ##create ghost class and do start
  dictionary = Hash.new
  File.readlines("dictionary.txt").each { |word| dictionary[word.chomp] = nil }
  arr_players = []
  puts "How many players?"
  input = gets.chomp.to_i
  input.times do |n|
    puts "What is your name?"
    name = gets.chomp
    arr_players << Player.new(name)
  end
  Ghost.new(dictionary,arr_players).run
end
