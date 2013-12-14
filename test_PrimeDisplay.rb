require_relative 'PrimeDisplay'
require 'test/unit'
require 'prime'

class PrimeDisplayTest < Test::Unit::TestCase

  def setup
    @size = (3..15).to_a.sample
    @primes = PrimeDisplay::PrimeGenerator.new( @size )
    @table = PrimeDisplay::Table.new @primes
  end

  def test_01_validate_prime_calculation
    assert Prime.take(@size).map { |n| PrimeDisplay::PrimeGenerator.prime?( n ) }.all?
  end
  
  def test_02_validate_prime_lists
    assert_equal( Prime.take(@size), @primes.list )
  end
  
  def test_03_validate_max_value
    assert_equal( Prime.take(@size).last**2, @table.data.last.last )
  end
  
end