class Human

  def make_guess(_)
    puts "Guess a position row,col"
    gets.chomp.split(",").map(&:to_i)
  end

end

class Computer

  attr_reader :answers

  def initialize
    @answers = Hash.new([])
  end

  def make_guess(board)
    puts "press enter"
    gets.chomp

    possible = random(board)
    guess = possible.sample

    ## if guess is possible is odd count (means turn2, else its turn1)

    if self.answers.keys.include?(board.[](guess).value)
      if possible.count.even?
        return self.answers[board.[](guess).value]
      end
    end

    self.answers[board.[](guess).value] = guess
    guess
  end

  def random(board)
    possible = []
    board.grid.each_with_index do |row, idx|
      row.each_index do |col|
        possible << [idx, col] if !board.[]([idx, col]).face_up
      end
    end
    possible
  end

end
