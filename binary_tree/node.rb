class BinaryTreeNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(val)
    @value = val
    @left = nil
    @right = nil
  end

  def add_child(val)
    if val < @value
      @left ? @left.add_child(val) : @left = BinaryTreeNode.new(val)
      p @left
    else
      @right ? @right.add_child(val) : @right = BinaryTreeNode.new(val)
    end
  end

  def inspect
    string = ["val: #{@value}"]
    string.push("left: #{@left.inspect}") if @left
    string.push("right: #{@right.inspect}") if @right
    string.join(", ")
  end

  def preorder
    p @value
    left.preorder if left
    right.preorder if right
  end

  def postorder
    left.postorder if left
    right.postorder if right
    p @value
  end

  def inorder
    left.inorder if left
    p @value
    right.inorder if right
  end
end
