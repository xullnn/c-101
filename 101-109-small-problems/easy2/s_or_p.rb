puts "Please enter an integer greater than 0:"
n = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operator = gets.chomp

if operator.downcase == 's'
  result = 1.upto(n).reduce(:+)
  puts "The sum of the integers between 1 and #{n} is #{result}."
elsif operator.downcase == 'p'
  result = 1.upto(n).reduce(:*)
  puts "The product of the integers between 1 and #{n} is #{result}."
else
  puts "Illegal input."
end
