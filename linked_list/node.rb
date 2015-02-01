class LLNode
  attr_accessor :prev, :next
  attr_reader :value

  def initialize(value)
    @value = value
  end
end
