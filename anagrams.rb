def first_anagram?(s1, s2)
    perms = s1.chars.permutation.to_a
    perms.include?(s2.chars)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# Phase 1: first_anagram? O(n!)

def second_anagram?(s1, s2)
    arr = s2.chars
    s1.chars.each_with_index do |c, i|
        return false unless arr.delete(c)
    end
    return true if arr.empty?
    false
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# Phase 2: second_anagram? O(n^2)

def third_anagram?(s1, s2)
    s1.chars.sort == s2.chars.sort
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

# Phase 3: third_anagram? O(n*log(n))

def fourth_anagram?(s1, s2)
    string_hash(s1) == string_hash(s2)
end

def string_hash(string)
    hash = {}
    string.each_char { |char| hash[char] = "value" }
    hash
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

# Phase 4: fourth_anagram? O(n)