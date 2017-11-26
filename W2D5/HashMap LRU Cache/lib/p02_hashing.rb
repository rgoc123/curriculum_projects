class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 918491823705918734 if empty?
    self.map.with_index { |el, i| el.hash * i }.reduce(:+)
  end
end

class String
  def hash
    return self.ord.hash * 8972340572 if self.length < 2
    self.chars.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
end
