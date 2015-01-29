require_relative 'node'

class BinaryTree
  attr_reader :head

  def initialize(root_val)
    @head = BinaryTreeNode.new(root_val)
  end

  def add_child(val)
    @head.add_child(val)
  end

  def preorder_recur
    head.preorder
  end

  # def preorder
  #   p @head.value
  #   queue = [@head]
  #   rights = []
  #   until queue.empty?
  #     curr = queue.shift
  #     p curr.value
  #     if curr.left
  #       queue.push(curr.left)
  #       rights.push(curr)
  #     else
  #       queue.push(rights.pop.right) if rights.length > 0
  #     end
  #   end
  # end


  # def preorder
  #   lefts = [@head]
  #   rights = []
  #   until lefts.empty? && rights.empty?
  #     if lefts.empty?
  #       curr = rights.pop
  #       if curr.right
  #         lefts.push(curr.right)
  #       end
  #     else
  #       curr = lefts.shift
  #       p curr.value
  #       if curr.left
  #         rights.push(curr) # => ['f', 'b']
  #         lefts.push(curr.left) # => []
  #       elsif curr.right
  #         lefts.push(curr.right)
  #       end
  #     end
  #   end
  # end

  def preorder
    stack = [@head]
    until stack.empty?
      curr = stack.pop
      p curr.value
      stack.push(curr.right) if curr.right
      stack.push(curr.left) if curr.left
    end
  end

  def postorder
    original = [@head]
    print = []
    until original.empty?
      node = original.pop
      print.push(node)
      original.push(node.right) if node.right
      original.push(node.left) if node.left
    end
    p print.map(&:value)
  end
end
