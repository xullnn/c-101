# new pet

pets = ['cat', 'dog', 'fish', 'lizard']
my_pet = pets[2]
puts "I hava a pet #{my_pet}."

# More than One

my_pets = pets[2,2]
puts "I have a pet #{my_pets.shift} and a #{my_pets.shift}."

# Free the Lizard

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop

# One Isn't Enough
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
my_pets << pets[1]

# What Color Are You?
colors = ['red', 'yellow', 'purple', 'green']
colors.each { |c| puts "I'm the color #{c}." }

# Doubled
numbers = [1, 2, 3, 4, 5]
p doubled_numbers = numbers.map { |n| n * 2 }

# Divisible by Three
numbers = [5, 9, 21, 26, 39]
p divisible_by_three = numbers.select { |n| n % 3 == 0}

# Favorite Number (Part 1)

info = ['Dave', 7, 'Miranda', 3, 'Jason', 11]
info.each_slice(2).to_a

# Favorite Number (Part 2)
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
flat_favorites = favorites.flatten

# Are We The Same?
array1 = [1, 5, 9]
array2 = [1, 9, 5]
p array1 == array2
