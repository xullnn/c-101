loop do
  puts "Infinite loop"
  break
end

loop do
  puts "First level loop"

  loop do
    puts "Inner loop"
    break
  end

  break
end

iterations = 1

loop do
  puts "Number of iterations: #{iterations}"
  iterations += 1
  break if iterations > 5
end

loop do
  puts "Should I stop looping?"
  answer = gets.chomp
  break if answer.downcase.start_with?("y")
end

say_hello = 1

while say_hello <= 5
  puts "Hello"
  say_hello += 1
end

numbers = []
while numbers.size < 5
  numbers << rand(100)
end
numbers

count = 1
until count > 10
  p count
  count += 1
end


numbers = [7, 9, 13, 25, 18]

until numbers.size == 0
  numbers.shift
end

numbers = [7, 9, 13, 25, 18]
idx = 0

until idx == numbers.size
  puts numbers[idx]
  idx += 1
end

for i in 1..100
  puts i if i.odd?
end

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends do
  puts "Hello #{friend}!"
end

number = 1

loop do
  if number.odd?
    puts "#{number} is odd."
  else
    puts "#{number} is even"
  end
  number += 1
  break if number > 5
end

loop do
  number = rand(100)
  puts number
  break if (1..10).include?(number)
end

process_the_loop = [true, false].sample

if process_the_loop
  puts "The loop was processed!"
else
  puts "The loop wasn't processed!"
end

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    break "That's corrent!"
  else
    puts "Wrong answer. Try again!"
  end
end

numbers = []

loop do
  puts "Enter any number:"
  numbers <<  gets.chomp.to_i
  break if numbers.size >= 5
end

numbers

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.pop
  break if names.empty?
end

5.times do |index|
  puts index
  break if index == 2
end

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next if number_a == 5 || number_b == 5
  puts "5 was reached!"
  break
end

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

n = 1

while n <= number_of_greetings
  greeting
  n += 1
end
