arr1 = []

loop do
  puts "Inject a number into an array, hit enter to stop:"
  input = gets.chomp
  if input == ""
    break
  else
    arr1 << input.to_i
  end
end

arr2 = arr1.map { |e| e += 2 }

p arr1
p arr2
