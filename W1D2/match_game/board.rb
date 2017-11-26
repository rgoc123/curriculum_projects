require_relative('card')

class Board
  attr_accessor :grid

  def initialize
    @grid = []
    self.populate
  end

  def populate
    ('a'..'z').to_a.sample(6).each do |letter|
      self.grid.concat([Card.new(letter), Card.new(letter)])
    end
    self.grid = self.grid.shuffle.each_slice(4).to_a
  end

  def render
    self.grid.each do |row|
      row.each_with_index do |card, idx|
        if idx == row.length - 1
          print card.to_s + " | \n"
        else
          print card.to_s + ' | '
        end
      end
    end
  end

  def won?
    self.grid.all? do |row|
      row.all?(&:face_up)
    end
  end

  def reveal(pos)
    self.grid[pos].reveal
  end

  def [](pos)
    row, col = pos
    self.grid[row][col]
  end

  def valid_move?(pos)
    row, column = pos
    return false if (row < 0) || (column < 0)
    return true if row < self.grid.length && column < self.grid.first.length
    false
  end

end
