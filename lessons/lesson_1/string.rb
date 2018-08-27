# ignoring case
name = 'Roger'

if name.downcase == 'RoGer'.downcase
  puts true
else
  puts false
end

if name == 'DAVE'
  puts true
else
  puts false
end

# http://ruby-doc.org/core-2.5.1/String.html#method-i-casecmp
#
puts name.casecmp("RoGer") == 0
puts name.casecmp("Dave") == 0

# goodbye, not hello

greeting = "Hello"
greeting.gsub!(/Hello/, "Goodbye!")

# print the alphabet

alphabet = 'abcdefghijklmnopqrstuvwxyz'
puts alphabet.split('')
# alphabet.each_char { |c| puts c }


# pluralize

words = 'car human elephant airplane'
words.split(" ").each { |w| puts(w + 's') }

# Are you there
colors = 'blue pink yellow orange'
colors.include?('yellow') ? puts(true) : puts(false)
