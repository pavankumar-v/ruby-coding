# STRING PROBLEMS

# EASY

# 1 Remove Outermost Parentheses
def remove_outermost_parentheses(s)
    len = s.length
    count = 0
    ans = ""

    for i in 0..len do
        if s[i] == '('
            count += 1
            ans += s[i] if count > 1
        end
        
        if s[i] == ')'
            ans += s[i] if count > 1
            count -= 1
        end
    end

    ans
end

# Example
# Input: s = "(()())(())"
# Output: "()()()"

# puts remove_outermost_parentheses("(()())(())") # ()()()
# puts remove_outermost_parentheses("(()())(())(()(()))") # ()()()()(())

# 2. Reverse Words in a String
# def reverse_words(s)
#     ans = ""
#     len = s.length
#     i = 0
#     words_stack = []

#     word = ""
#     while i < len
#         word += s[i] if s[i] != " "
#         if s[i] == " " || i == len - 1
#             words_stack.push(word)
#             word = ""
#         end
#         i += 1
#     end

#     n = words_stack.length
#     n.times do
#         ans += words_stack.pop() + " "
#     end

#     ans
# end # -> O(N)

def reverse_words(s)
    reverse_words = ""
    len = s.length
    i = 0

    temp = ""
    while i < len
        temp += s[i] if s[i] != " "
        is_last =  i == len - 1
        if s[i] == " " || is_last
            reverse_words = (temp + " " + reverse_words) if temp != ""
            temp = ""
        end
        i += 1
    end

    reverse_words.strip    reverse_words = ""
    len = s.length
    i = 0

    temp = ""
    while i < len
        temp += s[i] if s[i] != " "
        is_last =  i == len - 1
        if s[i] == " " || is_last
            reverse_words = (temp + " " + reverse_words) if temp != ""
            temp = ""
        end
        i += 1
    end

    reverse_words.strip
end # -> O(N), stack is not used

# Input: s = "the sky is blue"
# Output: "blue is sky the"

# puts reverse_words("the sky is blue")
# puts reverse_words("this is an amazing program")
# puts reverse_words("This is decent")

# Largest odd number in a string
# use a pointer, keep traversing from last, char at pointer is odd, if odd return the sliced string
def largest_odd_number(num)
    j = num.length - 1

    while j >= 0
        char = num[j]

        return num[0..j] if char.to_i.odd?

        j -= 1
    end

    ""
end

# puts largest_odd_number("1")
# puts largest_odd_number("3")
# puts largest_odd_number("13")
# puts largest_odd_number("132")
# puts largest_odd_number("10932")
# puts largest_odd_number("13932")
# puts largest_odd_number("19731288493")
# puts largest_odd_number("197312884931973100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000")

# Logest Common Prefix in strings
def longest_common_prefix(strs)
    return "" if strs.empty?

    prefix = strs[0]

    return prefix if strs.length == 1

    prefix = get_prefix(prefix, strs[1])

    for i in 2...strs.length do
        prefix = get_prefix(prefix, strs[i])

        break if prefix.strip.empty?
    end

    prefix
end

def get_prefix(str1, str2)
    prefix = ""
    for i in 0...([str1.length, str2.length].min) do
        break if str1[i] != str2[i]

        prefix += str1[i] # either str1 or str2 can be stored
    end

    prefix
end