# Phase 1: Naive Solution

def windowed_max_range(array, window_size)
    iterations = array.length - window_size + 1
    current_max_range = 0
    (0...iterations).each do |i|
        suba = array[i..i+window_size-1]
        range = suba.max - suba.min
        if range > current_max_range
            current_max_range = range
        end
    end
    current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) # == 6 # 3, 2, 5, 4, 8


class MyQueue
    def initialize
        @store = []
    end

    def peek
        @store[0]
    end

    def size 
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(value)
        @store.push(value)
    end

    def dequeue
        @store.shift
    end
end

class MyStack 
    def initialize
        @store = []
    end

    def peek
        @store.last
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(value)
        @store.push(value)
    end
end

class StackQueue
    def initialize
        @front = MyStack.new
        @back = MyStack.new
    end

    def size
        @front.length + @back.length 
    end

    def empty?
        @front.empty? && @back.empty?
    end

    def enqueue

    end

    def dequeue
        
    end
end