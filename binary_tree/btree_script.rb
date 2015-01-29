require_relative 'binary_tree'

b = BinaryTree.new('f')
['b', 'a', 'd', 'c', 'e', 'g', 'i', 'h'].each do |val|
  b.add_child(val)
end
b.preorder
