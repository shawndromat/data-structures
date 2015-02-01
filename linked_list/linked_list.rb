require_relative 'node'

class LinkedList
  attr_reader :head
  def initialize(value)
    @head = LLNode.new(value)
  end

  def insert(value)
    node = LLNode.new(value)
    node.next = @head
    @head.prev = node
    @head = node
  end

  def delete(value)
    node = LLNode.new(value)
    node.prev.next = node.next if node.prev
    node.next.prev = node.prev if node.next
    node.prev, node.next = nil, nil

    node
  end

  def search(value)
    current = head
    while current
      return current if current.value == value
      current = current.next
    end

    nil
  end
end


if __FILE__ == $PROGRAM_NAME
  list = LinkedList.new(3)
  list.insert(8)
  list.insert(10)
  list.insert(2)
  list.insert(6)
  p list.search(10)
end
