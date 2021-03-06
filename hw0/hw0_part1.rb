# Given an array of integers, return their sum.
# Return 0 if array is empty
def sum(numbers)
  return 0 if numbers.empty?
  numbers.inject { |total,number| total + number }
end

# Given an array of integers, return the sum of its two largest elements.
# Return 0 if array is empty.
# Return the element if the array only has one element
def max_2_sum(numbers)
  return 0 if numbers.empty?
  return numbers[0] if numbers.length==1
  numbers.sort.last(2).inject{ |total,number| total+number }
end

# Given an array of integers and an additional integer, return true if
# any two elements of the array sum up to the second argument.
# Return true if an empty array is given.
def sum_to_n?(numbers,value)
  return true if numbers.empty? and value==0
  return false if numbers.empty? and value!=0
  numbers.combination(2).to_a.any? { |x,y| x+y==value }
end

# Tests on the function 'sum'
puts "Tests on the function 'sum'"
puts "sum([2]) => #{sum([2])}"
puts "sum([]) => #{sum([])}"
puts "sum([1,2]) => #{sum([1,2])}"
puts "sum([1,2,3,4,5,6,7,8,9]) => #{sum([1,2,3,4,5,6,7,8,9])}"
puts "--------------------------------------"
puts

# Tests on the function 'max_2_sum'
puts "Tests on the function 'max_2_sum'"
puts "max_2_sum([2]) => #{max_2_sum([2])}"
puts "max_2_sum([]) => #{max_2_sum([])}"
puts "max_2_sum([1,2]) => #{max_2_sum([1,2])}"
puts "max_2_sum([1,2,9,4,5,8,7,3,6]) => #{max_2_sum([1,2,9,4,5,8,7,3,6])}"
puts "--------------------------------------"
puts

# Tests on the function sum_to_n?
puts "Tests on the function 'sum_to_n?'"
puts "sum_to_n?([],5) => #{sum_to_n?([],5)}"
puts "sum_to_n?([],0) => #{sum_to_n?([],0)}"
puts "sum_to_n?([2],5) => #{sum_to_n?([2],5)}"
puts "sum_to_n?([5],5) => #{sum_to_n?([5],5)}"
puts "sum_to_n?([2,4,3],5) => #{sum_to_n?([2,4,3],5)}"
puts "sum_to_n?([4,5,1,10],14) => #{sum_to_n?([4,5,1,10],14)}"
puts "sum_to_n?([3,5,1,10],14) => #{sum_to_n?([3,5,1,10],14)}"
puts "--------------------------------------"
