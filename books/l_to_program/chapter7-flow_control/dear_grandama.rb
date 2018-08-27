while true
  puts "You are saying to grandma: "
  you_said = gets.chomp
  if you_said == you_said.upcase && you_said != "BYE"
    year = (rand(21) + 1930).to_s
    puts "NO, NOT SINCE #{year}"
  elsif you_said == "BYE"
    puts "OK, BYE!"
    break
  else
    puts "HUH? SPEAK UP, SONNY!"
  end
end
