puts "Hi, how old are you?"

age = gets.chomp.to_i

[10,20,30,40].each do |n|
  puts "In #{n} years you will be #{age + n}"
end
