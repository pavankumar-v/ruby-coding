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

puts reverse_words("the sky is blue")
puts reverse_words("this is an amazing program")
puts reverse_words("This is decent")