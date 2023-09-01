require "byebug"
# Write a method, all_vowel_pairs, that takes in an array of words and returns
# all pairs of words that contain every vowel. Vowels are the letters a, e, i,
# o, u. A pair should have its two words in the same order as the original
# array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"]) # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
  all_vowel_array = []
  vowels = ["a","e","i","o","u"]
  words.each.with_index do |word1,index1|
    words.each.with_index do |word2,index2|
      if index2 > index1
        pair = word1 + " " + word2
        all_vowel_array << pair if vowels.all? {|vowel| pair.include?(vowel)}
      end 
    end 
  end 
  return all_vowel_array  
end


# Write a method, composite?, that takes in a number and returns a boolean
# indicating if the number has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true composite?(13)    # => false
def composite?(num)
  return false if num < 2
  (2...num).any? {|factor| num%factor==0}
  
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the order of their appearance in the
# original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  found = []
  bigrams.each do |bigram|
    found << bigram if str.include?(bigram)
  end 
  return found
end


# Write a method, Hash#my_select, that takes in an optional proc argument
# The method should return a new hash containing the key-value pairs that return
# true when passed into the proc.
# If no proc is given, then return a new hash containing the pairs where the key
# is equal to the value.
#
# Examples:
#
# hash_1 = {x: 7, y: 1, z: 8}
# hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
#
# hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
# hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
# hash_2.my_select                            # => {4=>4}
class Hash
  def my_select(&prc)
    prc ||= Proc.new{|k,v| k == v}
    new_hash = {}
    self.each do |key,value|
      new_hash[key] = value if prc.call(key,value) == true
    end 
    return new_hash    
  end
end


# Write a method, String#substrings, that takes in a optional length argument
# The method should return an array of the substrings that have the given length.
# If no length is given, return all substrings.
#
# Examples:
#
# "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
# "cats".substrings(2)  # => ["ca", "at", "ts"]
class String
  def substrings(num = nil)
    sub_strings = []

    i = 0 
    while i < self.length
      j=0
      while j < self.length - i 
        sub_strings << self[i..i+j]
        j+=1 
      end 
      i+=1
    end 
    if num != nil
       sub_strings.select! {|ele| ele.length == num}
    end  
    return sub_strings
  end
end


# Write a method, String#caesar_cipher, that takes in an a number.
# The method should return a new string where each char of the original string
# is shifted the given number of times in the alphabet.
#
# Examples:
#
# "apple".caesar_cipher(1)    #=> "bqqmf"
# "bootcamp".caesar_cipher(2) #=> "dqqvecor"
# "zebra".caesar_cipher(4)    #=> "difve"
class String
  def caesar_cipher(num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    cipher = ""
    self.each_char do |char|
      position = alphabet.index(char)
      new_position = (position+num)%26
      cipher += alphabet[new_position]
    end 
    return cipher
  end
end