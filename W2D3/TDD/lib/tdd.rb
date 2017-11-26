class Array
  def my_uniq
    uniq_arr = []
    self.each do |el|
      uniq_arr << el unless uniq_arr.include?(el)
    end 
    uniq_arr
  end
  
  def two_sum
    two_sums = []
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length 
        two_sums << [i, j] if self[i] + self[j] == 0
        j += 1
      end 
      i += 1 
    end 
    two_sums
  end    
end 

def my_transpose(arr)

  raise ArgumentError unless arr.is_a?(Array) && arr.length == arr.first.length 
  
  transposed_arr = []
  
  arr.length.times do |idx|
    temp = []
    arr.each do |el|
      temp << el[idx]
    end
    transposed_arr << temp
  end 
  transposed_arr
end 

def stock_picker(arr)
  raise ArgumentError unless arr.is_a?(Array) 
  return [arr.index(arr.min)] if arr == arr.sort.reverse
  
  greatest_difference = 0
  buy_sell = [-1,-1]
  
  arr.each_with_index do |el, i|
    next if arr[i..-1].none? {|ele| ele > el}
    j = i + 1 
    while j < arr.length 
      if el < arr[j] && (arr[j] - el) > greatest_difference
        greatest_difference = arr[j] - el
        buy_sell = [i,j]
      end
      j += 1
    end
  end
  
  buy_sell
end



class TowersOfHanoi
  attr_reader :board
  
  def initialize
    @board = [[3,2,1],[],[]]
  end

  def move(start_pos, end_pos)
    if valid_move?(start_pos, end_pos)
      start = self.board[start_pos].pop
      self.board[end_pos].push(start)
    end
    self.board
  end
  
  def won?
    self.board[0..1].any? {|el| el.length == 3}
  end
  
  private
  attr_writer :board
  
  def valid_move?(start_pos, end_pos)
    return false unless start_pos.between?(0,2) && end_pos.between?(0,2)
    return false if self.board[start_pos].empty?
    return true if self.board[end_pos].empty?
    return false if self.board[start_pos].last > self.board[end_pos].last
    true
  end
end