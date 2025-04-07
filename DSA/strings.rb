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

        return num[0..j] if char.to_i.odd? # => or Integrer(char) % 2 != 0 => odd true

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

# # using hash map
# def check_if_anagram(s1, s2)
#   char_freq = {}

#   # O(n)
#   s1.each_char do |char|
#     char_freq[char] = (char_freq[char] || 0) + 1
#   end

#   # O(n)
#   s2.each_char do |char|
#     char_freq[char] = (char_freq[char] || 0) + 1
#   end

#   # O(n)
#   !char_freq.values.any?(&:odd?)
# end # O(3n) = O(n)

# using hash map
def check_if_anagram(s1, s2)
    char_freq = Array.new(256, 0)

    # O(n)
    s1.each_char do |char|
      char_freq[char.ord] = (char_freq[char.ord] || 0) + 1
    end

    # O(n)
    s2.each_char do |char|
      char_freq[char.ord] = (char_freq[char.ord] || 0) - 1
    end

    # O(n)
    char_freq.all?(&:zero?)
  end # O(3n) = O(n)

# p check_if_anagram("", "") # true
# p check_if_anagram("A", "A") # true
# p check_if_anagram("A", "B") # false
# p check_if_anagram("HELLO", "LLOEH") # true
# p check_if_anagram("SDFSDF", "SDBTER") # false


# Group Anagrams https://leetcode.com/problems/group-anagrams/description/
# Input: strs = ["eat","tea","tan","ate","nat","bat"]
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
# non-optimal
# def group_anagrams(strs)
#   grouped_anagrams = [] # O (1)
#   visited = Array.fill(strs.length, false) # O (1)

#   for i in 0...strs.length
#     next if visited[i].eql?(true)
#     str1 = strs[i]
#     visited[i] = true
#     anagrams = [str1]

#     for j in (i+1...strs.length)
#       str2 = strs[j]

#       if check_if_anagram(str1, str2)
#         anagrams.push(str2)
#         visited[j] = true
#       end
#     end

#     grouped_anagrams.push(anagrams) if anagrams.any?
#   end

#   grouped_anagrams
# end

def group_anagrams(strs)
  # store sorted str as key identifier and add values if anagram
  grouped_anagrams = {}

  strs.each do |str|
    # stort str -> "nat","tan" -> "ant" "ant"
    sorted_str = str.chars.sort.join

    grouped_anagrams[sorted_str] ||= []
    grouped_anagrams[sorted_str] << str
  end

  grouped_anagrams.values
end

# p group_anagrams(["eat","tea","tan","ate","nat","bat"]) # [["bat"],["nat","tan"],["ate","eat","tea"]]

# Find All Anagrams in a String https://takeuforward.org/data-structure/anagram-substring-search/
#
# Input: s = "cbaebabacd", p = "abc"
# Output: [0,6]
# Explanation:
# The substring with start index = 0 is "cba", which is an anagram of "abc".
# The substring with start index = 6 is "bac", which is an anagram of "abc".

# Non-optimal approach
# def find_all_anagrams(s, p)
#   # get length m (s) & n (p)
#   m = s.length
#   n = p.length

#   # edge case return empty if m < n
#   return [] if m < n

#   # sort p so that it can be compared with sorted substring of s
#   sorted_p = p.chars.sort.join

#   # now iterate over s and check if sorted substring in s is equal to sorted_p
#   indices = []

#   # iterate only till m - (n + 1) because we will check for n length substrings, so it does not make sense to iterate beyond m - n + 1
#   for i in 0..(m - n)
#     p s[i]
#     # get substring from i till n
#     substring = s[i..(i + n - 1)] # i = 0, n = 3, 0 till 2, 3 till 5, i + n = 3 + 3 = 6 - 1 = 5
#     if substring.chars.sort.join == sorted_p
#       indices.push(i)
#     end
#   end

#   return indices
# end

# Optimal approach
# using hashing + counting + sliding window technique
def find_all_anagrams(s, p)
  indices = []
  m, n = s.length, p.length

  # length of s should be greater than p or else it's not valid anagram
  return indices if m < n

  # setup 2 array of 26 length to handle cout of p and count of substring of s
  count_p, count_s = Array.new(26, 0), Array.new(26, 0)

  # count the first 0 till p window of substring in s
  for i in 0...n
    # count p
    p_index = p[i].ord - 'a'.ord
    count_p[p_index] += 1

    # count s
    s_index = s[i].ord - 'a'.ord
    count_s[s_index] += 1
  end

  # for initial window if p count and s count is same 0th index is captured
  indices << 0 if count_p == count_s

  # slide window from p till s.length
  for i in n...m do
    # remove left most element from the count_s
    left_char = s[i - n]
    count_s[left_char.ord - 'a'.ord] -= 1

    new_char = s[i]
    count_s[new_char.ord - 'a'.ord] += 1

    # store start index of the substring
    indices << (i - n + 1) if count_p == count_s
  end

  return indices
end

p find_all_anagrams("abc", "abcd") # output -> []
p find_all_anagrams("", "abcd") # output -> []
p find_all_anagrams("baa", "aa") # output -> [1]
p find_all_anagrams("cbaebabacd", "abc") # output -> [0, 6]
