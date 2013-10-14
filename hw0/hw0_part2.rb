# Given a string, returns "Hello, " plus the string.
def hello(name)
  "Hello, #{name}"
end

# Given a string, returns true if it starts with a consonant, false otherwise.
def starts_with_consonant?(s)
  !!(s =~ /^[A-Z&&[^AEIOU]]/i)
end

# Given a string, returns true if the string represents a binary number that
# is a multiple of 4
# Returns false if the string is not a valid binary number
def binary_multiple_of_4?(s)
  return false unless s =~ /^[01]+$/ and s.to_i!=0
  s.to_i(2)%4==0
end

# Tests on the function 'hello(name)'
puts "hello('') => #{hello('')}"
puts "hello('Cunha') => #{hello('Cunha')}"
puts "hello('Paulo Cunha') => #{hello('Paulo Cunha')}"
puts "--------------------------"
puts

# Tests on the function 'starts_with_consonant?(s)'
puts "starts_with_consonant?('') => #{starts_with_consonant?('')}"
puts "starts_with_consonant?('ABC') => #{starts_with_consonant?('ABC')}"
puts "starts_with_consonant?('abc') => #{starts_with_consonant?('abc')}"
puts "starts_with_consonant?('cba') => #{starts_with_consonant?('cba')}"
puts "starts_with_consonant?('CBA') => #{starts_with_consonant?('CBA')}"
puts "starts_with_consonant?('UOIEA') => #{starts_with_consonant?('UOIEA')}"
puts "starts_with_consonant?('51AS') => #{starts_with_consonant?('51AS')}"
puts "starts_with_consonant?('*51AS') => #{starts_with_consonant?('*51AS')}"
puts "--------------------------"
puts

#Tests on the function 'binary_multiple_of_4?(s)'
puts "binary_multiple_of_4?('') => #{binary_multiple_of_4?('')}"
puts "binary_multiple_of_4?('10100102') => #{binary_multiple_of_4?('10100102')}"
puts "binary_multiple_of_4?('sdf12010102') => #{binary_multiple_of_4?('sdf12010102')}"
puts "binary_multiple_of_4?('*sdf12010102') => #{binary_multiple_of_4?('*sdf12010102')}"
puts "binary_multiple_of_4?('10101110') => #{binary_multiple_of_4?('10101110')}"
puts "binary_multiple_of_4?('100') => #{binary_multiple_of_4?('100')}"
puts "binary_multiple_of_4?('1000') => #{binary_multiple_of_4?('1000')}"
puts "binary_multiple_of_4?('10100') => #{binary_multiple_of_4?('10100')}"
puts "binary_multiple_of_4?('1010101010100') => #{binary_multiple_of_4?('1010101010100')}"
puts "binary_multiple_of_4?('0') => #{binary_multiple_of_4?('0')}"
puts "binary_multiple_of_4?('1') => #{binary_multiple_of_4?('1')}"
