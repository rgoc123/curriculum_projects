class Array
  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end
  end

  def my_select(&prc)
    selects = []
    self.my_each do |el|
      selects << el if prc.call(el)
    end
    selects
  end

  def my_reject(&prc)
    selects = []
    self.my_each do |el|
      selects << el unless prc.call(el)
    end
    selects
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end
    true
  end

  def my_flatten
    flat = []
    self.my_each do |el|
      if el.is_a?(Array)
        flat += el.my_flatten
      else
        flat << el
      end
    end
    flat
  end

  def my_zip(*arrays)
    zipped = []
    all_arrays = arrays.unshift(self)

    (0...all_arrays[0].length).to_a.my_each do |i|
      subzip = []
      all_arrays.my_each do |el|
        subzip << el[i]
      end

      zipped << subzip
    end

    zipped
  end

  def my_rotate(rotation = 1)
    split_idx = rotation % self.length
    drop(split_idx) + take(split_idx)
  end

  def my_join(separator = '')
    joined = ''
    (0...self.length).to_a.my_each do |idx|
      joined += self[idx]
      joined += separator unless idx == (self.length - 1)
    end
    joined
  end

  def my_reverse
    reversed = []

    (self.length - 1).downto(0) { |idx| reversed << self[idx] }

    reversed
  end



  def bubble_sort!(&bubble_proc)
    bubble_proc ||= Proc.new { |num1, num2| num1 <=> num2 }
    sorted = false
    # bubble_array = self.dup

    until sorted
      sorted = true

      self.each_index do |idx1|
        idx2 = idx1 + 1
        next if idx2 > self.length - 1
        if bubble_proc.call(self[idx1], self[idx2]) == 1
          self[idx1] , self[idx2] = self[idx2] , self[idx1]
          sorted = false
        end
      end

    end

    self
  end

  def bubble_sort
  #   bubble_proc ||= Proc.new { |num1, num2| num1 <=> num2 }
  #   sorted = false
  #   new_arr = self.dup
  #
  #   until sorted
  #     sorted = true
  #
  #     new_arr.each_cons(2) do |x, y|
  #       if bubble_proc.call(x, y) == 1
  #         x, y = y, x
  #         sorted = false
  #       else
  #         next
  #       end
  #     end
  #
  #   end
  #
  #   new_arr
  # end

    self.dup.bubble_sort!
  end
end



def factors(num)
  (1..num).to_a.select do |el|
    num % el == 0
  end

end

def substrings(string)
  strings = []

  string.chars.each_index do |idx|
    string.chars.each_index do |idx2|
      next if idx2 < idx
      strings << string[idx..idx2]
    end
  end
  strings
end

def subwords(word, dictionary)
  substrings(word).select { |el| dictionary.include?(el) }
end
