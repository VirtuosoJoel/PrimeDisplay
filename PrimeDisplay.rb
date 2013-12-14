# Class to provide a namespace and simplify usage of Prime and Table
class PrimeDisplay
  attr_accessor :table

  def initialize( number=10 )
    self.table = Table.new( PrimeGenerator.new( number ) )
  end

  def display
    table.display
  end
  
  # Create and display a table of primes and their multiples
  class Table

    attr_accessor :data
    
    def initialize( prime_array )
      
      prime_array = prime_array.list if PrimeGenerator === prime_array
      
      # Add a header column
      prime_array = [nil] + prime_array
      
      # Build a 2D Array
      self.data = prime_array.map { |y| y ? prime_array.map { |x| x ? x*y : y  } : prime_array }
      
    end # initialize
    
    # Print table to the console
    def display
      puts self
    end
    
    # Allow inspection since to_s is defined
    def inspect
      "#{ self.class }:0x#{ '%x' % (object_id << 1) }: #{ data }"
    end
    
    # Convert to String for output
    def to_s
    
      # Determine the column width
      col_width = data.last.last.to_s.length
      
      # Determine the table width
      table_width = ( col_width + 1 ) * data.length + 1
      
      # Convert 2D Array to String
      data.map { |row| '|' + row.map { |val| val.to_s.ljust( col_width ) }.join('|') + '|' }.join("\n#{ '-' * table_width }\n")
      
    end
    
  end # Table
  
  
  # Create and hold a list of prime numbers
  class PrimeGenerator
    
    attr_accessor :list
    
    def initialize( list_length )
      
      self.list = []
      
      while list.length < list_length
        num = ( list[-1] || 1 ) + 1
        num+=1 until prime?( num )
        list << num
      end
      
    end # initialize
    
    # Instance method from Class method
    def prime?( number )
      self.class.prime? number
    end
    
    # Test whether a number is prime
    def self.prime?( number )
    
      # Catch invalid input
      raise ArgumentError, 'Prime must be an Integer' unless Fixnum === number

      # Discount the easy ones
      return true if number == 2
      return false if number.even? || number == 1
      
      # Brute-force calulation
      ( 3..( Math.sqrt( number ).ceil ) ).each { |n| return false if ( number % n ).zero? }
      
      # If no previous returns triggered, it's a prime
      true
      
    end # prime?
    
  end # PrimeGenerator
  
  
end # PrimeDisplay