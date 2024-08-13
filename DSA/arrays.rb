# EASY
# program to find the number of times any 2 integer in the array can be subtracted to get difference P
def count_difference(arr, p)
  n = arr.length
  visited = {}
  count = 0

  for i in 0...n do
    reqNum = (arr[i] - p)
    count += 1 unless visited[reqNum].nil?
    visited[arr[i]] = i
  end

  count
end

# puts countDifference([1, 2, 3, 2], 1)
# puts countDifference([1, 2, 3, 8], 5)

# 2 sum, Check if a pair with given sum exists in Array
def two_sum(arr, k)
  n = arr.length
  visited = {}
  indexes = [-1, -1]

  for i in 0...n do
    # for j in (i+1)...n do
    #     if (arr[i] + arr[j]) == k
    #         indexes = [i, j]
    #         return indexes
    #     end
    # end
    req = k - arr[i]
    unless visited[req].nil?
      indexes = [visited[req], i]
      return indexes
    end

    visited[arr[i]] = i
  end

  indexes
end

# puts twoSum([2,6,5,8,11], 14).to_s
# puts twoSum([2,6,5,8,11], 8).to_s

# Find second largest element from the array
def largest_elem(arr)
  n = arr.length
  largest = arr[0]

  for i in 1...n
    largest = arr[i] if arr[i] > largest
  end

  largest
end

# puts largest_elem([-1, 3, 6, 0, 10])

# Find second largest element from the array
def second_largest_ele(arr)
  n = arr.length
  largest = -Float::INFINITY
  second_lar = -Float::INFINITY

  for i in 0...n
    if arr[i] > largest
      second_lar = largest
      largest = arr[i]
    elsif arr[i] > second_lar && arr[i] != largest
      second_lar = arr[i]
    end
  end

  second_lar
end

# puts second_largest_ele([-1, 3, 6, 0, 10])
# puts second_largest_ele([-1, 3, 6, 20, 10, 11])
# puts second_largest_ele([19, 3, 6, 20, 10, 11])

def is_arr_sorted?(arr, desc: false)
  n = arr.length

  unless desc
    for i in 1...n
      return false if arr[i - 1] > arr[i]
    end
  end

  if desc
    for i in 1...n
      return false if arr[i - 1] < arr[i]
    end
  end

  true
end

# puts is_arr_sorted?([1, 2, 3 ,4 ,5])
# puts is_arr_sorted?([12, 2, 3 ,4 ,5])
# puts is_arr_sorted?([-1, 2, 3 ,4 ,5])
# puts is_arr_sorted?([5, 4, 3, 2, 1], desc: true)
# puts is_arr_sorted?([5, 10, 3, 2, 1], desc: true)
# puts is_arr_sorted?([-1, 10, 3, 2, 1], desc: true)

# Remove Deuplicated from array
def remove_dup(arr)
  n = arr.length
  i = 0
  ans = [] # using stack
  # visited = Set.new # using set

  for i in 0...n do
    # arr.delete_at(i) if visited.include?(arr[i])
    # visited << arr[i]
    ans.push(arr[i]) if ans.last != arr[i]
  end

  # visited.to_a
  ans
end

# reverse array
def reverse_array(arr, s = 0, e = arr.length - 1)
  while s < e
    temp = arr[s]
    arr[s] = arr[e]
    arr[e] = temp
    s += 1
    e -= 1
  end

  arr
end

# puts removeDup([1,1,2,3,4,4]).to_s
# puts removeDup([-1,-1, 0, 0,1,2,3,4,4]).to_s
# puts removeDup([-1,-1, 0, 0,1,2,3,4]).to_s

# Rotate Array by one place to right
# arr = [1, 2, 3, 4, 5, 6] rotate to right by k = 2
# o/p arr = [5, 6, 1, 2, 3, 4]
def rotate_arr_by_k_right(arr, k = 1)
  n = arr.length
  k_items = []

  raise StandardError.new("k should be less than #{n}") if k > n

  for i in (n - k)...n do
    k_items.push arr[i]
  end

  # start rotation to right by k positions
  for i in (n - k - 1).downto(0) do
    arr[i + k] = arr[i]
  end

  # fill the first k positions with k_items
  for i in 0...k_items.length do
    arr[i] = k_items[i]
  end

  arr
end

# puts rotate_arr_by_k([1, 2, 3, 4, 5, 6], 1).to_s
# puts rotate_arr_by_k([1, 2, 3, 4, 5, 6], 7).to_s

def rotate_arr_by_k_left(arr, k = 1)
  n = arr.length
  k_items = []

  raise StandardError.new("k should be less than #{n}") if k > n

  for i in 0..k - 1 do
    k_items.push arr[i]
  end

  # start rotation to right by k positions
  for i in k...n do
    arr[i - k] = arr[i]
  end

  # fill the first k positions with k_items
  for i in (n - k)...n do
    arr[i] = k_items[n - i - 1]
  end

  arr
end

# puts rotate_arr_by_k_left([1, 2, 3, 4, 5], 2).to_s
# puts rotate_arr_by_k_left([1, 2, 3, 4, 5, 6], 2).to_s

# rotate array using reversal method
def rotate_arr_k_right(arr, k = 1)
  n = arr.length - 1

  reverse_array(arr, n - k + 1)
  reverse_array(arr, 0, n - k)
  reverse_array(arr)
end

def rotate_arr_k_left(arr, k = 1)
  n = arr.length - 1

  reverse_array(arr, 0, k - 1)
  reverse_array(arr, k)
  reverse_array(arr)
end

# puts reverse_array([1, 2, 3], 1).to_s

# puts rotate_arr_k_right([1, 2, 3, 4, 5, 6]).to_s
# puts rotate_arr_k_right([1, 2, 3, 4, 5, 6, 7], 4).to_s

# puts rotate_arr_k_left([1, 2, 3, 4, 5, 6], 2).to_s
# puts rotate_arr_k_left([1, 2, 3, 4, 5, 6]).to_s
# k = 1 -> [2, 3, 4, 5, 6, 1]
# [1, 2, 3, 4, 5, 6]
# [1, 6, 5, 4, 3, 2]
# [2, 3, 4, 5, 6, 1]

# push 0's to end
# brute force
# def push_zeros_to_end(arr)
#     n = arr.length - 1;
#     # collect non zero elements in one temp array
#     temp = []

#     for i in 0..n do
#         temp.push arr[i] if arr[i] != 0
#     end

#     # modify orginal array with non zero items from temp
#     for i in 0...temp.length do
#         arr[i] = temp[i]
#     end

#     # now fill the rest of the array with zero
#     # from where? from temp.length + 1
#     for i in (temp.length)..n do
#         arr[i] = 0
#     end

#     arr
# end

# using two pointer method
def push_zeros_to_end(arr)
  n = arr.length - 1

  # set a pointer that always keeps pointing to zero -> say j
  # next using another pointer to move forward, when a non zero ele is found, swap j with i and increase j

  # first set j to initial 0 pointer
  for i in 0..n
    if arr[i] == 0
      j = i
      break
    end
  end

  # keep swapping with j when i is non zero and increase j
  for i in (j + i)..n
    next unless arr[i] != 0

    temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
    j += 1
  end

  arr
end

# puts push_zeros_to_end([1, 2, 3, 0, 4, 5, 0, 6]).to_s
# puts push_zeros_to_end([1, 0, 3, 0, 2, 4, 1, 0, 4]).to_s
# puts push_zeros_to_end([1, 0, 3, 0, 2, 4, 1, 2, 4]).to_s

# Union of Two Sorted Arrays
# The union of two arrays can be defined as the common and distinct elements in the two arrays.
# def union_of_arr(arr1, arr2)
#     set = Set.new

#     arr1.each do |num|
#         set.add num
#     end

#     arr2.each do |num|
#         set.add num
#     end

#     set.to_a
# end

# two pointer
def union_of_arr(arr1, arr2)
  n1 = arr1.length
  n2 = arr2.length
  union = []
  i = 0
  j = 0

  while (i < n1) && (j < n2)
    if arr1[i] <= arr2[j]
      union.push(arr1[i]) if union.last != arr1[i]
      i += 1
    else
      union.push(arr2[j]) if union.last != arr2[j]
      j += 1
    end
  end

  while i < n1
    union.push(arr1[i]) if union.last != arr1[i]
    i += 1
  end

  while j < n2
    union.push(arr2[j]) if union.last != arr2[j]
    j += 1
  end

  union
end

# puts union_of_arr([1, 2, 4], [1, 2, 3, 4, 5, 6, 1]).to_s

# Find missing number from array

# brute force
# def find_missing_number(arr)
#     n = arr.length

#     for i in 1..n do
#         flag = 0
#         for j in 0..n do
#             if i == arr[j]
#                 flag = 1
#                 break
#             end
#         end

#         return i if flag == 0
#     end

#     return -1
# end

# using hashing with freq
def find_missing_number(a, n)
  # using hashing
  # freq_arr = Array.new(n).fill(0)
  # # storing fequency
  # for i in 0...n do
  #     freq_arr[arr[i]] = freq_arr[i] + 1
  # end

  # puts freq_arr.to_s

  # for i in 1..n do
  #     if freq_arr[i] === 0
  #         return i
  #     end
  # end

  # return -1

  summation = (n * (n + 1)) / 2

  # Summation of all array elements:
  s2 = 0
  a.each do |num|
    s2 += num
  end

  summation - s2
end

# puts find_missing_number([1, 3], 3)
# puts find_missing_number([1, 2], 3)
# puts find_missing_number([1, 2, 3, 5], 5)
# puts find_missing_number([1, 3, 4, 5], 5)

# Count Maximum Consecutive One's in the array
# Brute Force
# def max_consq_ones(arr)
#   n = arr.length
#   count = 0

#   for i in 0..n do
#     next unless arr[i] == 1

#     for j in i..n do
#       if arr[j] != 1
#         count = [count, j - i].max
#         break
#       end
#     end
#   end

#   count
# end

# using one loop, and two pointer
def max_consq_ones(arr)
  n = arr.length
  count = 0
  max_count = 0

  for i in 0..n do
    if arr[i] == 1
      count += 1
      max_count = [max_count, count].max
      next
    end

    count = 0
  end

  max_count
end

# Ex: [1, 1, 0, 1, 1, 1] -> 3
# puts max_consq_ones([1, 1, 0, 1, 1, 1]) # 3
# puts max_consq_ones([1, 1, 0, 1, 1, 1, 1]) # 4
# puts max_consq_ones([1, 1, 1, 1, 1, 1, 1]) # 7

# Find the number that appears once, and the other numbers twice

# Brute Force apporach would be using linear search using two loops

# using Hash Map
def apprears_ones(arr)
  n = arr.length
  feq_map = {}

  # cal feq of all the items in arr
  for i in 0..n do
    feq_map[arr[i]] = (feq_map[arr[i]] || 0) + 1
  end

  for i in 0..feq_map.keys.length do
    return feq_map.keys[i] if feq_map[feq_map.keys[i]] == 1
  end

  -1
end

def apprears_ones_usg_xor(arr)
  n = arr.length
  ans = 0

  for i in 0...n do
    ans ^= arr[i]
  end

  ans
end

# puts apprears_ones_usg_xor([2, 2, 1]) # 1
# puts apprears_ones_usg_xor([2, 2, 1, 3, 3]) # 1
# puts apprears_ones_usg_xor([4, 2, 1, 1, 2]) # 4
# puts apprears_ones_usg_xor([2, 2, 1, 1, 5]) # 5
# puts apprears_ones_usg_xor([2, 2, 1, 5, 1]) # 5

# Longest Subarray with given Sum K(Positives)

# Brute Force using two loop
# using two loops
# def sub_arr_sum_k(arr, k)
#   n = arr.length
#   ans = -1

#   for i in 0..n do
#     sum = arr[i]
#     for j in (i + 1)...n do
#       sum += arr[j]
#       next if sum > k

#       ans = [ans, j - i + 1].max if sum == k
#     end
#   end

#   ans
# end

# using two pointer & sliding window problem
def sub_arr_sum_k(arr, k)
  n = arr.length
  s = 0
  e = 0
  sum = 0
  ans = -1

  while e < n
    sum += arr[e]

    if sum > k
      sum -= arr[s]
      s += 1
    end

    ans = [ans, e - s + 1].max if sum == k

    e += 1
  end

  ans
end

# puts sub_arr_sum_k([1, 2, 3], 3) # 2
# puts sub_arr_sum_k([1, 2, 3, 2, 2, 2], 6) # 3
# puts sub_arr_sum_k([1, 2, 3, 2, 2, 2, 1, 1, 1, 1, 1], 5) # 5
# puts sub_arr_sum_k([1, 2, 3, 2, 2, 2, 1, 1, 1, -1, 1, 2], 5) # 6

# MEDIUM

# TWO SUM
# Check if a pair with given sum exists in Array
# using loops
# def two_sum(arr, k)
#   n = arr.length

#   for i in 0..n do
#     sum = 0
#     for j in (i + 1)...n do
#       sum = arr[i] + arr[j]

#       return [i, j] if sum == k
#     end
#   end

#   [-1, -1]
# end

# using maths and hash map
def two_sum(arr, k)
  n = arr.length
  visit_map = {}

  for i in 0...n do
    req = k - arr[i]

    return [i, visit_map[req]].sort unless visit_map[req].nil?

    visit_map[arr[i]] = i
  end

  [-1, -1]
end

# puts "#{two_sum([1, 2, 3, 4, 5], 5)}" # [1, 2]
# puts "#{two_sum([1, 2, 3, 4, 5], 3)}" # [0, 1]
# puts "#{two_sum([1, 2, 3, 4, 5, 3, 1, 10, 32, 10], 14)}" # [3, 7]
# puts "#{two_sum([1, 2, 3, 4, 5, 3, 1, 10, 32, 10], 8)}" # [2, 4]

# Sort an array of 0s, 1s and 2s
# use normal array sort

# use selection sorting ( use two loops, keep selecting smallest item in the range and swap if on to the outer i)
# def sort_zeros_ones_twos(arr)
#   n = arr.length

#   for i in 0..n do
#     min_index = i
#     for j in (i+1)...n do
#       if (arr[j] < arr[min_index])
#         min_index = j
#       end
#     end

#     if min_index != i
#       # temp = arr[i]
#       # arr[i] = arr[min_index]
#       # arr[min_index] = temp

#       # short hand method
#       arr[i], arr[min_index] = arr[min_index], arr[i]
#     end
#   end

#   arr
# end

# using hash map
# def sort_zeros_ones_twos(arr)
#   n = arr.length
#   freq_map = {
#     0 => 0,
#     1 => 0,
#     2 => 0,
#   }

#   ans = []

#   for i in 0...n do
#     freq_map[arr[i]] += 1
#   end

#   freq_map.each do |num, freq|
#     ans.push(*Array.new(freq).fill(num))
#   end

#   ans
# end

# using 3 pointer approach
def sort_zeros_ones_twos(arr)
  n = arr.length
  i = 0
  mid = 0
  h = n - 1

  while mid <= h
    case arr[mid]
    when 0
      arr[i], arr[mid] = arr[mid], arr[i]
      i += 1
      mid += 1
    when 1
      mid += 1
    when 2
      arr[h], arr[mid] = arr[mid], arr[h]
      h -= 1
    end
  end

  arr
end

# puts sort_zeros_ones_twos([1, 0, 2, 0, 1, 2]).to_s
# puts sort_zeros_ones_twos([1, 0, 2, 0, 1, 2, 0]).to_s
# puts sort_zeros_ones_twos([2, 0, 2, 0, 1, 2, 0, 0, 0, 1]).to_s
