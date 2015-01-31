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

  def postorder_recur
    head.postorder
  end

  def inorder_recur
    head.inorder
  end

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
