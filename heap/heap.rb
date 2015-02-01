class BinaryHeap
  def initialize(dir = :max, heap = [])
    @heap = heap.dup
    @dir = dir
    build_heap
  end

  def <<(val)
    @heap << val
    heapify_up(@heap.length - 1)
  end

  def pop
    if @heap.length <= 1
      @heap.pop
    else
      max = @heap[0]
      @heap[0] = @heap.pop
      heapify_down(0)

      max
    end
  end

  def node
    @heap[0]
  end

  private

  def sym
    @dir == :max ? ">" : "<"
  end

  def parent(i)
    if i % 2 == 0
      (i / 2) - 1
    else
      i / 2
    end
  end

  def left(i)
    (2 * i) + 1
  end

  def right(i)
    2 * (i + 1)
  end

  def build_heap
    (@heap.length/2).downto(0).each do |idx|
      heapify_down(idx)
    end
  end

  def heapify_up(i)
    current = i
    while parent(current) >= 0 && (@heap[current].send(sym, @heap[parent(current)]))
      @heap[parent(current)], @heap[current] = @heap[current], @heap[parent(current)]
      current = parent(current)
    end
  end

  def heapify_down(idx)
    current = idx
    loop do
      larger = current
      left, right = left(current), right(current)
      
      if left < @heap.length && (@heap[left].send(sym, @heap[current]))
        larger = left
      end
      if right < @heap.length && (@heap[right].send(sym, @heap[larger]))
        larger = right
      end

      return if larger == current

      @heap[larger], @heap[current] = @heap[current], @heap[larger]
      current = larger
    end 
  end
end

if __FILE__ == $PROGRAM_NAME
  b = BinaryHeap.new(:max, [9, 3, 1, 4, 7, 5, 0])
  p b
  b << 10
  p b
end
