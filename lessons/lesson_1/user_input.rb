# repeater

puts "Type anyting you want:"
response = gets.chomp
puts response

# age

puts "What is your age in years?"
age = gets.chomp.to_i
month = age * 12

# puts something
loop do
  puts "Do you want me to print something? (y/n)"
  response = gets.chomp
  if response == 'y'
    puts "Something."
  else
    puts ""
    break
  end
end

loop do
  puts "Do you want me to print something? (y/n)"
  response = gets.chomp.downcase
  if response == 'y'
    puts "Something"
  elsif response == 'n'
    puts "Bye"
    break
  else
    puts "Invalid input! Please enter y or n"
  end
end

# lsprint
loop do
  puts "How many output lines do you want? Enter a number >= 3:"
  n = gets.chomp.to_i
  if n >= 3
    n.times { puts "Hello world!"}
    break
  else
    puts "Not enough lines"
  end
end

# password

PASSWORD = 7

loop do
  puts "Give me a number between 0 to 10."
  n = gets.chomp.to_i
  if n == PASSWORD
    puts "You got the right one."
    break
  else
    puts "Keep trying..."
  end
end

# login

validate_info = { name: "Caven", password: '123456' }

loop do
  puts "Please enter user name:"
  name = gets.chomp
  puts "Please enter your password:"
  password = gets.chomp
  if name == validate_info[:name] && password == validate_info[:password]
    puts "Login successfully."
    break
  else
    puts "Authorization faild"
  end
end

# dividing number

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

loop do
  puts "Please enter the numerator:"
  numerator = gets.chomp
  puts "Please enter the denominator:"
  denominator = gets.chomp

  if valid_number?(numerator) && valid_number?(denominator)
    if denominator.to_i == 0
      puts "Invalid input. A denominator of 0 is not allowed."
    else
      puts "#{numerator} / #{denominator} equals #{numerator.to_i / denominator.to_i}"
    break
    end
  else
    puts "Invalid input. Only integers are allowed."
  end
end

# print multiple times
loop do
  puts " How many output lines do you want? Enter a number >= 3 (Q to quit):"
  response = gets.chomp
  if response == 'q'
    break "Bye-bye"
  else
    if response.to_i >= 3
      puts "Hello world!"
    else
      puts "Not enough lines."
    end
  end
end

# opposite attract

loop do
  puts "Please enter a positive or negative integer:"
  x = gets.chomp.to_i
  puts "Please enter a positive or negative integer:"
  y = gets.chomp.to_i
  if x * y < 0
    puts "#{x} + #{y} = #{x + y}"
    break
  else
    puts "Sorry. One integer must be positive, one must be negative."
  end
end
