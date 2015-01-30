require_relative 'heap'

def heap_sort!(arr)
  heap = BinaryHeap.new(:max, arr)

  arr.length.times do |i|
    arr[-(i + 1)] = heap.pop
  end

  arr
end

p heap_sort!([4, 8, 3, 2, 15, 4, 3, 2, 1])
