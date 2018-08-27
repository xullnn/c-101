# puts "Enter the first number:"
# first = gets.chomp.to_i
#
# puts "Enter the second number:"
# second = gets.chomp.to_i
#
# puts "#{first} + #{second} = #{first + second}"
# puts "#{first} - #{second} = #{first - second}"
# puts "#{first} * #{second} = #{first * second}"
# puts "#{first} / #{second} = #{first / second}"
# puts "#{first} % #{second} = #{first % second}"
# puts "#{first} ** #{second} = #{first ** second}"

# another solution
operators = [:+, :-, :*, :/, :%, :**]

puts "Enter the first number:"
first = gets.chomp.to_i

puts "Enter the second number:"
second = gets.chomp.to_i

operators.each do |operator|
  puts "#{first} #{operator.to_s} #{second} = #{first.send(operator, second)}"
end
