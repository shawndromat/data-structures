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
    queue = [@head]
    until queue.empty?
      current = queue.pop
      puts current.value
      queue.push(current.right) if current.right
      queue.push(current.left) if current.left
    end
  end

  def postorder
    queue = [@head]
    print = []
    until queue.empty?
      current = queue.pop
      print.push(current)
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right
    end
    p print.reverse.map(&:value)
  end

  def inorder
    queue = [@head]
    print = []
    until queue.empty? && print.empty?
      unless queue.empty?
        current = queue.pop
        print.push(current)
        queue.push(current.left) if current.left
      else
        current = print.pop
        p current.value
        queue.push(current.right) if current.right
      end
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  tree = BinaryTree.new('f')
  ['b', 'g', 'a', 'd', 'i', 'c', 'e', 'h'].each do |char|
    tree.add_child(char)
  end

  puts "Should be f, b, a, d, c, e, g, i, h"
  tree.preorder

  puts "Should be a, c, e, d, b, h, i, g, f"
  tree.postorder

  tree.inorder
end
