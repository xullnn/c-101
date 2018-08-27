puts "What is the bill?"
bill = gets.chomp.to_i
puts "What is the tip percentage?"
percentage = gets.chomp.to_i

tip = bill * percentage / 100
total = bill + tip

puts "The tip is $#{tip}."

puts "The total is $#{total}."
