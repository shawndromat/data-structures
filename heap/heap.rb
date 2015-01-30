class BinaryHeap
  def initialize(heap)
    @heap = heap || []
  end

  def <<(val)
    @heap << val
    heapify_up
  end

  def parent(i)
    if i % 2 == 0
      (i / 2) - 1
    else
      i / 2
    end
  end

  def pop
    if @heap.length <= 1
      @heap.pop
    else
      max = @heap[0]
      @heap[0] = @heap.pop
      max_heapify_down

      max
    end
  end

  def left(i)
    (2 * i) + 1
  end

  def right(i)
    2 * (i + 1)
  end

  def max_heapify_up
    (@heap.length - 1).downto(1).each do |idx|
      parent_idx = self.parent(idx)
      if @heap[idx] > @heap[parent_idx]
        @heap[idx], @heap[parent_idx] = @heap[parent_idx], @heap[idx]
      end
    end
  end

  def max_heapify_down
    current = 0
    loop do
      larger = current
      left, right = left(current), right(current)
      
      if left < @heap.length && (@heap[left] > @heap[current])
        larger = left
      end
      if right < @heap.length && (@heap[right] > @heap[larger])
        larger = right
      end

      return if larger == current

      @heap[larger], @heap[current] = @heap[current], @heap[larger]
      current = larger
    end 
  end
end

b = BinaryHeap.new([5,4,3,2,1])
p b.remove_parent
p b
