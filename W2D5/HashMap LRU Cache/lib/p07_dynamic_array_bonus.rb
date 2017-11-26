class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

require 'byebug'
class DynamicArray
  include Enumerable

  attr_reader :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    if i < 0
      @store[i + @count]
    else
      @store[i]
    end
    rescue
      nil
  end

  def []=(i, val)
    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    self.each do |el|
      return true if el == val
    end
    false
  end

  def push(val)
    self.each_with_index do |el, i|
      if el.nil?
        @store[i] = val 
        @count += 1
        break
      end
    end
  end

  def unshift(val)
    temp_arr = self.deep_dup
    i = 1
    temp_arr.each do |el|
      break if el.nil?
      @store[i] = el
      i += 1
    end
    @store[0] = val
    @count += 1
  end

  def pop
    popped = nil
    self.each_with_index do |el, i|
      if self[i + 1].nil?
        popped = self[i]
        self[i] = nil
        @count -= 1
        break
      end
    end
    popped
  end

  def shift
    shift = nil
    shift = @store[0]
    self.each_with_index do |el, i|
      next if i == 0
      if el.nil?
        @store[i - 1] = nil
        break
      end
      @store[i - 1] = el
    end
    @count -= 1
    shift
  end

  def first
    @store[0]
  end

  def last
    self.reverse_each { |el| return el unless el.nil? }
  end

  def each(&prc)
    i = 0
    while i < @store.length
      prc.call(@store[i])
      i += 1
    end
  end
  
  def deep_dup
    deep_dupeed = []
    self.each do |el|
      deep_dupeed << el
    end
    deep_dupeed
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    old_store = @store
    new_store = DynamicArray.new(@count * 2)
    @count = 0
    old_store.each do |ele|
      new_store.push(ele)
    end
    new_store
  end
end
