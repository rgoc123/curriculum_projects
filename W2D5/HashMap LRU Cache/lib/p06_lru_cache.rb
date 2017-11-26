require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_node!(@map.get(key))
    else
      calc!(key)
      eject! if self.count > @max
    end
    @map.get(key).val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    new_val = @prc.call(key)
    new_node = @store.append(key, new_val)
    @map.set(key, new_node)
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    node.remove
    updated_node = @store.append(node.key, node.val)
    @map.set(updated_node.key, updated_node)
  end

  def eject!
    oldest_key = @store.first.key
    @store.remove(oldest_key)
    @map.delete(oldest_key)
  end
end
