# This class represents a book with an isbn number and the price of the book
class BookInStock
  attr_accessor :isbn
  attr_accessor :price

  # Raise excpetion if isbn number is empty or if the price is less than or
  # equal to 0
  def initialize(isbn,price)
    raise ArgumentError, 'ISBN number is empty' if isbn.empty?
    raise ArgumentError, 'Price less than or equal to zero' if price <= 0
    @isbn = isbn
    @price = price
  end

  # Return the price with a leading '$' and 2 decimal cases
  def price_as_string
    "$"+"%0.2f" % @price
  end

end


# Tests on class 'BookInStock'
the_hobbit = BookInStock.new("123456789",23.32)
puts the_hobbit.isbn
the_hobbit.isbn = "987654321"
puts the_hobbit.isbn
puts the_hobbit.price
the_hobbit.price = 23.1
puts the_hobbit.price
puts the_hobbit.price_as_string
the_hobbit.price = 23.14534
puts the_hobbit.price
puts the_hobbit.price_as_string

# The following tests raise an ArgumentError exception
#the_empty = BookInStock.new("",43.12)
#the_free = BookInStock.new("456789",0)
#the_less_than_free = BookInStock.new("456789",-20.56)
