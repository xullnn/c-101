puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

will_work = retire_age - age
this_year = Time.new.year
retire_year = this_year + will_work

puts "It's #{this_year}. You will retire in #{retire_year}."
puts "You have only #{will_work} years of work to go!"
