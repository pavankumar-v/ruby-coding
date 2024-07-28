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

# puts check_palindrome(1221)
# puts check_palindrome(1212)
# puts check_palindrome(1234)
# puts check_palindrome(1222221)

# GCD of a number

# BRUTE FORCE
# def gcd_of_nums(n1, n2)
#     gcd = 1

#     for i in 1..([n1, n2].min) do
#         if (n1 % i == 0) && (n2 % i == 0)
#             gcd = i
#         end
#     end

#     gcd
# end

# optimal, iterate from backwards 
def gcd_of_nums(n1, n2)
    for i in [n1, n2].min.downto(0) do
        if (n1 % i == 0) && (n2 % i == 0)
            return i
        end
    end

    1
end

# puts gcd_of_nums(20, 40)
# puts gcd_of_nums(12, 10)
# puts gcd_of_nums(10, 5)
# puts gcd_of_nums(123, 34)