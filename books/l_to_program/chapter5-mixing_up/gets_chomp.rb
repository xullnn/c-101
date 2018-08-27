puts 'Hello there, and what\'s your name?'
# Hello there, and what's your name?
#  => nil
name = gets
'Caven'
# => "'Caven'\n"
puts 'your name is ' + name + '? What a lovely name!'
# your name is 'Caven'
# ? What a lovely name!
#  => nil
puts 'Pleased to meet you,' + name + '. :)'
# Pleased to meet you,'Caven'
# . :)
#  => nil
puts 'Hello there, and what\'s your name?'
# Hello there, and what's your name?
# => nil
name = gets.chomp
# 'Caven'
#  => "'Caven'"
puts 'Your name is ' + name + '? What a lovely name!'
# Your name is 'Caven'? What a lovely name!
#  => nil
puts 'Pleased to meet you, ' + name + '. :)'
# Pleased to meet you, 'Caven'. :)
#  => nil
