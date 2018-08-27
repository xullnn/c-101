info = {}
File.open("some_path/people.txt") do |f|
  line = f.gets
  if line
    name_birth = line.split(",")
    info[name_birth[0]] = name_birth[1]
  end
end
puts "Tell me a name, I'll tell you his/her birthday and age"

name = gets.chomp

birthday = info[name]

birth_year = birthday.split(',').last
age = Time.new.year - birth_year

puts "This person's birthday: #{birthday}, age: #{age}"
