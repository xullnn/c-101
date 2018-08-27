# puts "Teddy is #{rand(20..200)} years old!"

# further
puts "Give me a name: "
answer = gets.chomp
answer.empty? ? name = "Teddy" : name = answer

puts "#{name} is #{rand(20..200)} years old!"
