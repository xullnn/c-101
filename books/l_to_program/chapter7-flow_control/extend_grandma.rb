count_bye = 0
while true
  puts "You are saying to grandma: "
  you_said = gets.chomp
  if you_said == you_said.upcase && you_said != "BYE"
    count_bye = 0
    year = (rand(21) + 1930).to_s
    puts "NO, NOT SINCE #{year}"
  elsif you_said == "BYE"
    count_bye += 1
    if count_bye == 3
      puts "OK, BYE!"
      break
    end
  else
    count_bye = 0
    puts "HUH? SPEAK UP, SONNY!"
  end
end
