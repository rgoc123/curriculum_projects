require 'byebug'
class PolyTreeNode
  attr_reader :value, :parent, :children
  
  def initialize(value)
    @parent = nil 
    @children = [] 
    @value = value
  end
  
  def parent=(parent_node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent_node
    @parent.children << self unless parent_node.nil?
  end
  
  def add_child(child_node)
    child_node.parent=(self)
  end
  
  def remove_child(child_node)
    raise "this node is not a child" unless self.children.include?(child_node)
    child_node.parent=(nil) 
  end
  
  def inspect
    puts "value: #{@value}"
    puts "parent: #{@parent}"
    puts "children: #{@children}"
  end
  
  def dfs(target)
    return self if self.value == target
    self.children.each do |node|
      search_result = node.dfs(target)
      return search_result unless search_result.nil?
    end
    nil
  end
  
  def bfs(target)
    queue = [self]
    until queue.empty?
      return queue[0] if queue[0].value == target
      queue += queue[0].children
      queue.shift
    end
    nil
  end
  
  
  
end