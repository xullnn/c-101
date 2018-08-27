puts "Input a starting year: "
starting_year = gets.chomp.to_i
puts "Input a ending year: "
ending_year = gets.chomp.to_i

current_year = starting_year
while current_year <= ending_year
  if current_year % 100 == 0
    if current_year % 400 == 0
      puts current_year
    end
  else
    if current_year % 4 == 0
      puts current_year
    end
  end
  current_year += 1
end
