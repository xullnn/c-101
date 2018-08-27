loop do
  puts "What does 2 + 2 equal?"
  answer = gets.chomp.to_i
  if answer == 4
    break "Correct!"
  else
    puts "Wrong, try again."
  end
end

# only even
number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# first to five
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  break "5 was reached!" if number_a == 5 || number_b == 5
end

# greeting

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end
