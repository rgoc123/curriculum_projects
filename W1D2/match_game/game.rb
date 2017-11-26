require_relative 'board'
require_relative 'player'

class Game

  attr_reader :board, :human

  def initialize(player)
    @board = Board.new
    @player = player
  end

  def play
    until self.board.won?
      self.take_turn
    end
    'YOU WON!!!'
  end

  def good_guess
    input = @player.make_guess(self.board)
    p input
    until self.board.valid_move?(input) && !self.board[input].face_up
      puts "That's not a move"
      input = gets.chomp.split(",").map(&:to_i)
    end

    input
  end

  def take_turn
    card1 = self.good_guess
    system "clear"
    self.board[card1].reveal
    self.board.render

    card2 = self.good_guess
    self.board[card2].reveal
    self.board.render

    if self.board[card1] == self.board[card2]
      self.board[card1].reveal
      self.board[card2].reveal
    else
      self.board[card1].hide
      self.board[card2].hide
    end
  end

end
