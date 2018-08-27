loop do
  puts "Hello!"
  puts "Type 'STOP' to stop."
  command = gets.chomp
  if command == 'STOP'
    break
  end
end
