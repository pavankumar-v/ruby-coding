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