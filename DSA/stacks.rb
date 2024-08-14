# check for balanced Parentheses
def check_for_balanced_parentheses(str)
    open_paren_stack = []
    parentheses_map = {
        '(' => ')',
        '[' => ']',
        '{' => '}',
    }

    for i in 0...str.length do
        if !parentheses_map[str[i]].nil?
            open_paren_stack.push(str[i])
            next
        end

        next if str[i] == " "

        last_paren = open_paren_stack.pop
        return false if parentheses_map[last_paren] != str[i]
    end


    open_paren_stack.empty?
end

# EX: "([]){}" => true
# EX: "([)]{}" => false
p check_for_balanced_parentheses("{}") # true
p check_for_balanced_parentheses("()") # true
p check_for_balanced_parentheses("[]") # true
p check_for_balanced_parentheses("{)") # false
p check_for_balanced_parentheses("()]") # false
p check_for_balanced_parentheses("([]){}") # true
p check_for_balanced_parentheses("([)]{}") # flase