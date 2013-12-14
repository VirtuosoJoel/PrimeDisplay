require_relative 'PrimeDisplay'

puts 'Please enter the number of primes to display (1-14):'
num = Integer gets
puts( if num.between?( 1, 14 )
  PrimeDisplay.new( num ).display
else
  'Invalid input: ' + num.to_s
end )