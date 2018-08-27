def ask(question)
  while true
    puts question
    answer = gets.chomp.downcase
    if answer == "yes" || answer == "no"
      return answer
    else
      puts "Please answer yes or no."
    end
  end
end

ask("Are you happy?")
