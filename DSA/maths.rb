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

# Check if a number is Armstrong Number or not
def armstrong(num)
    n = num
    sum = 0

    while n > 0
        last_digit = n % 10
        sum += (last_digit * last_digit * last_digit)

        n = n / 10
    end

    sum
end

puts armstrong(153) #=> 1^3 + 5^3 + 3^3 = 153 # true
puts armstrong(123)
puts armstrong(371)

# Print all Divisors of a given Number
def divisors(num)
    all_divisors = []
    i = 0
    
    for i in 1..Math.sqrt(num) do
        # break if (i*i) > num

        if num % i == 0 
            all_divisors.push(i)
            all_divisors.push(num/i) if i != (num / i)
        end
    end

    all_divisors
end

puts divisors(12).sort.to_s
puts divisors(10).sort.to_s
puts divisors(2).sort.to_s
puts divisors(4).sort.to_s
puts divisors(100).sort.to_s

# PRIME NUMBERS 
# def is_prime(n)
#     return false if n == 0 || n == 1

#     count = 1

#     for i in 2..n do
#         if n % i == 0
#             count += 1
#         end
#     end

#     count == 2
# end

# optimal using sqrt
def is_prime(n)
    return false if n == 0 || n == 1

    for i in 2..(Math.sqrt(n)) do #=> 2X4 AND 4X2
        return false if n % i == 0
    end

    true
end

# puts "0 #{is_prime(0)}"
# puts "1 #{is_prime(1)}"
# puts "2 #{is_prime(2)}"
# puts "3 #{is_prime(3)}"
# puts "4 #{is_prime(4)}"
# puts "5 #{is_prime(5)}"
# puts "6 #{is_prime(6)}"
# puts "7 #{is_prime(7)}"
# puts "8 #{is_prime(8)}"
# puts "9 #{is_prime(9)}"
# puts "10 #{is_prime(10)}"