puts "Tell me a number:"
num = gets.chomp.to_i

# if num >= 100
#   puts "Number is above 100"
# else
#   if num > 50
#     puts "Number is between 50 and 100"
#   else
#     puts "Number is between 0 and 50"
#   end
# end

case
when num >= 100
  puts "Number is above 100"
when num > 50 && num < 100
  puts "Number is between 50 and 100"
when num > 0 && num < 50
  puts "Number is between 0 and 50"
end
