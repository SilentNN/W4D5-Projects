def bad_two_sum?(arr, target)
    arr.each_with_index do |num,i|
        arr[i+1..-1].each do |num2|
            if num + num2 == target 
                return true
            end
        end
    end
    false
end


# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false
# quadratic time complexity

def okay_two_sum?(arr, target)
    new_arr = arr.sort
    new_arr.each_with_index do |num, i|
        return true if (new_arr[0...i]+new_arr[i+1..-1]).bsearch { |num2| num + num2 == target}
    end
    false
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false
# linearithmic time complexity



# What does sorting do to the lower bound of your time complexity?
    # Makes the lower bound higher (i.e. slower)

# How might sorting that make the problem easier?
    # A lot faster


def two_sum?(arr, target)
    h = {}
    arr.each_with_index do |num, i|
        h[num] = i
    end

    num2 = target - num

    arr.each_with_index do |num, i|
        return true if h.include?(num2) && h[num2] != i
    end
    false
end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false
# # linear