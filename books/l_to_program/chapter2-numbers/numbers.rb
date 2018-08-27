# How many hours are in a year?
h_per_year = 365 * 24
puts "There are #{h_per_year} hours in a year."

# How many minutes are in a decade?
m_per_decade = 10 * h_per_year * 60
puts "There are #{m_per_decade} minutes in a decade."

# How many seconds old are you?
s_old_me = 29 * h_per_year * 3600
puts "I am #{s_old_me} seconds old."

# How old am I?
# If I am 1160 million seconds old
my_h_old = (1160 * (10**6))/3600
my_y_old = my_h_old / h_per_year
puts "I am #{my_y_old} years old."
