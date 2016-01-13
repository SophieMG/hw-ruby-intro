# Sophie Greene modified this on 12/01/2016
# When done, submit this entire file to the autograder.

# Part 1
#Define a method sum(array) that takes an array of integers as 
#an argument and returns the sum of its elements. 
#For an empty array it should return zero.
def sum arr
    raise ArgumentError, 'Argument is not array' unless arr.is_a? Array
    return 0 if arr.length ==0 
    arr.reduce(:+)
end
#Test cases
raise "sum([]!=0)" if sum([])!=0
raise "sum([1,2,3,4]) != 10" if sum([1,2,3,4]) != 10

#Define a method max_2_sum(array) which takes an array of
#integers as an argument and returns the sum of its two largest elements.
#For an empty array it should return zero. 
#For an array with just one element, it should return that element.
def max_2_sum arr
    return 0 if arr.length == 0
    return arr[0]   if arr.length == 1
    return arr.sort.reverse.first(2).reduce(:+)
end
raise"max_2_sum([])!=0" if max_2_sum([])!=0
raise"max_2_sum([1])!=1" if max_2_sum([1])!=1
raise"max_2_sum([1,2,3,4,5,3,1,8])!=13" if max_2_sum([1,2,3,4,5,3,1,8])!=13

#Define a method sum_to_n?(array, n) that takes an array of integers and an additional integer, 
#n, as arguments and returns true if any two elements in the array of integers sum to n. 
#An empty array should sum to zero by definition.
def sum_to_n? (arr, n)
    return false if arr.length == 0 and n == 0
    return false if arr.length == 0 and n != 0
    arr.combination(2).any? {|a, b| (a + b) == n }
end

raise "not F sum_to_n?([],0)" if sum_to_n?([],0)
raise "not T sum_to_n?([2,3],5)" if not sum_to_n?([2,3],5)
raise "not F sum_to_n?([1,2,3,4],2)" if sum_to_n?([1,2,3,4],2)

# Part 2
#Define a method hello(name) that takes a string representing a
# name and returns the string "Hello, " concatenated with the name.
def hello(name)
    return "Hello, " + name
end
=begin
    Define a method starts_with_consonant?(s) that takes 
    a string and returns true if it starts with a consonant and false otherwise. 
    #(For our purposes, a consonant is any letter other than A, E, I, O, U.)
    NOTE: be sure it works for both upper and lower case and for nonletters!
=end
def starts_with_consonant? s
    return false if s =~ /^[^a-zA-Z]/
    return true if s =~ /^[^AEIOU]/i 
end
raise "not T starts_with_consonant?'v'" if not starts_with_consonant? 'v' 
raise "not F starts_with_consonant?''" if starts_with_consonant? '' 
raise "not F starts_with_consonant?'\vooh'" if starts_with_consonant? '\vvhov' 
raise "not F starts_with_consonant?'ajjs'" if starts_with_consonant? 'ajsjd' 
=begin
    Define a method binary_multiple_of_4?(s) that takes a string and
    returns true if the string represents a binary number that is a multiple of 4.
    NOTE: be sure it returns false if the string is not a valid binary number!
=end
def binary_multiple_of_4? s
    return false if s == ''
    return false if s =~ /[^01]/
    return false if s.to_i % 4 != 0
    return true
end
raise "binary_multiple_of_4?'' not false "  if  binary_multiple_of_4?('') 
raise "binary_multiple_of_4?'s' not false "  if  binary_multiple_of_4?('s') 
raise " binary_multiple_of_4?'01' not false "  if  binary_multiple_of_4?('01') 
# Part 3


class BookInStock
=begin
  Define a class BookInStock which represents a book with an ISBN number,
  isbn, and price of the book as a floating-point number, price, as attributes.
=end

    include Enumerable
    include Comparable
    def initialize(isbn,price)
        raise ArgumentError unless isbn.is_a? String and isbn.length > 0
        raise ArgumentError unless price > 0
        @isbn = isbn
        @price = price
    end
   def <=> other
        @price <=> other.price
    end
=begin 
    def < other
        @price < other.price
    end
    def > other
        @price > other.price
    end
    def == other
        @price == other.price
    end
    def != other
        @price != other.price
    end
=end
=begin
    The constructor should accept the ISBN number
    (a string, since in real life ISBN numbers can begin with zero and can include hyphens) 
    as the first argument and price as second argument, and should raise ArgumentError 
    (one of Ruby's built-in exception types) if the ISBN number is
    the empty string or if the price is less than or equal to zero.
    Include the proper getters and setters for these attributes.
=end
    attr_accessor:isbn
    attr_accessor:price
=begin
    Include a method price_as_string that returns the price of the book 
    formatted with a leading dollar sign and two decimal places,
    that is, a price of 20 should format as "$20.00" and a price of 33.8 
    should format as "$33.80".
=end  
    def price_as_string
        s= sprintf( "%0.02f", @price)
        return '$'+s
    end
end

