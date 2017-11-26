require_relative '00_tree_node.rb'

class KnightPathFinder
  
  attr_reader :root, :visited
  
  KNIGHT = [[-1,-2],[1,-2],[2,-1],[2,1],[1,2],[-1,2],[-2,1],[-2,-1]].shuffle
  
  def initialize(start  = [0,0])
    @visited = [start]
    @current_pos = start
    
    @root = PolyTreeNode.new(start)
    self.build_move_tree
  end

  def build_move_tree
    queue = [@root]
    until queue.empty?
        next_moves = self.new_move_pos(queue[0].value).map do |node_val|  
          new_node = PolyTreeNode.new(node_val)
          queue[0].add_child(new_node)
          new_node
        end
      queue.concat(next_moves)
      queue.shift
    end
  end
  
  def self.valid_moves(pos)
    x, y = pos
    result = []
    KNIGHT.each do |movement|
      a, b = movement
      result << [x+a, y+b] if valid_move?([x+a, y+b]) 
    end
    result
  end
  
  def self.valid_move?(pos)
    x, y = pos
    x.between?(0,7) && y.between?(0,7)
  end
  
  def new_move_pos(pos)
    new_moves = self.class.valid_moves(pos).reject {|move| @visited.include?(move)}
    @visited.concat(new_moves)
    new_moves 
  end
  
  def find_path(target)
    current_node = trace_path_back(target)
    results = [current_node.value]
    until current_node.parent.nil?
      results.unshift(current_node.parent.value)
      current_node = current_node.parent
    end
    results
  end
  
  def trace_path_back(target, node = @root)
    return node if node.value == target
    node.children.each do |child_node|
      search_result = self.trace_path_back(target, child_node)
      return search_result unless search_result.nil?
    end
    nil
  end
  
end