require_relative 'game.rb'
require_relative 'player'

if $PROGRAM_NAME == __FILE__
  puts "Welcome to Card Game!"
  puts "Would you like to play, or watch the computer?"
  puts " c = computer, p = player"
  input = gets.chomp
  until input =='c' || input =='p'
    input = gets.chomp
  end
  if input == 'c'
    Game.new(Computer.new).play
  else
    Game.new(Human.new).play
  end
end
