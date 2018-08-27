nums = []

puts "Enter the 1st number:"
nums << gets.chomp.to_i

puts "Enter the 2nd number:"
nums << gets.chomp.to_i

puts "Enter the 3rd number:"
nums << gets.chomp.to_i

puts "Enter the 4th number:"
nums << gets.chomp.to_i

puts "Enter the 5th number:"
nums << gets.chomp.to_i

puts "Enter the 6th number:"
sixth = gets.chomp.to_i

if nums.include?(sixth)
  puts "The number #{sixth} appears in #{nums}"
else
  puts "The number #{sixth} does not appear in #{nums}"
end
