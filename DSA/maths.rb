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
        ans += last_digit * 10 

        num = num / 10
    end


    ans
end

puts reverse_number(12345)