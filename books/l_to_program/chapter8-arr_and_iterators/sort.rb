def sort_inputs
  arr = []
  while true
    puts "Please type a word: "
    input = gets.chomp
    if input == ""
      puts arr.sort.to_s
      return
    else
      arr << input
    end
  end
end

sort_inputs
