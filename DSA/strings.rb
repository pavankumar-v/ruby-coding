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

puts remove_outermost_parentheses("(()())(())") # ()()()
puts remove_outermost_parentheses("(()())(())(()(()))") # ()()()()(())

# 2. Reverse Words in a String
def reverse_words(s)
    ans = ""
    len = s.length
    i = len
    j = len
    
end

# Input: s = "the sky is blue"
# Output: "blue is sky the"
