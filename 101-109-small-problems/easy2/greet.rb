puts "What's your name?"
name = gets.chomp

if name[-1] == "!"
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello, #{name}"
end
