# Homework 1 - Part 1
module FunWithStrings
  # Part A - Palindromes
  def palindrome?
    self.downcase.gsub(/[^a-zA-Z]/,'') == self.downcase.reverse.gsub(/[^a-zA-Z]/,'')
  end
  
  # Part B - Word Count
  def count_words
    count = Hash.new{0}
    self.downcase.strip.split(/\W+/).each { |word| count[word]+=1 }
    count
  end
  
  # Part C - Anagrams
  def anagram_groups
    self.split(' ').sort{ |x,y| y.length <=> x.length }.group_by{ |word| word.chars.sort }.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
