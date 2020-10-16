require 'byebug'
# def my_min(arr)
#     arr.each { |ele| return ele if arr.all? {|el| ele <= el }}
# end

# phase 1 O(n^2)

def my_min(arr)
    output = nil
    arr.each do |ele|
        if output.nil? || ele < output
            output = ele
        end
    end
    output
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

#phase 2 is O(n)


def largest_contiguous_subsum_1(list)
    subarrays = [] #1
    list.each_with_index do |ele1, i| #n
        list[i...list.length].each_with_index do |ele2,i2| #(n-1)
            subarrays << list[i..i2+i] #k 
        end
    end # n^2
    subarrays.map { |subarray| subarray.sum}.max # n^x
end

#phase 1 is a polynomial 

def largest_contiguous_subsum(list)
    
    largest = -1*Float::INFINITY
    current_sum = 0

    list.each do |num|
        if (current_sum += num ) < 0
            current_sum = 0
            if largest < num
                largest = num
            end
        else
            largest = current_sum if largest < current_sum
        end
    end
    largest
    # last_idx = 0
    # list.each_with_index do |e, i|
    #     if current_sum < 0 || (current_sum += e) > largest
    #         last_idx = i 
    #         largest = current_sum > 0 ? current_sum : e
    #     end
    # end
    # p largest
    # p last_idx
    # largest = -1*Float::INFINITY
    # current_sum = 0

    # last_idx.downto(0).each do |i|
    #     if current_sum < 0 || (current_sum += list[i]) > largest
    #         largest = current_sum > 0 ? current_sum : list[i]
    #     end
    # end

    # largest
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

# list = [-10, -5, -16, 1, 1, -27, -11, -2, -21, -20]
# p largest_contiguous_subsum(list) # => 2

# list = []
# 10.times { list << rand(-30..1) }
# p list
# p largest_contiguous_subsum_1(list)
# p largest_contiguous_subsum(list)