# ALL BASIC MATHS

# COUNT DIGITS
# EX - 103432 -> O/P -> 6

def count_digits(num)
    count = 0

    while num > 0
        num = num / 10
        count += 1
    end

    count
end

# puts count_digits(12345)
# puts count_digits(1234345)

# REVERSE A NUMBER
def reverse_number(num)
    ans = 0

    while num > 0
        last_digit = num % 10
        ans = (ans * 10) + last_digit 

        num = num / 10
    end


    ans
end

# puts reverse_number(12345)
# puts reverse_number(3912)
# puts reverse_number(1)
# puts reverse_number(12)
# puts reverse_number(1212)
# puts reverse_number(1221) # palindrome

# PALINDROME
def check_palindrome(num)
    n = num
    num == reverse_number(n)
end

puts check_palindrome(1221)
puts check_palindrome(1212)
puts check_palindrome(1234)
puts check_palindrome(1222221)