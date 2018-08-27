# # The return value of method `set_password` is a new password string
  # line 6 is trying to set password to a new one but it won't work since they are in different scope
  # The method here can only return a string
  # so we can change line 6 to new_password or we can directly delete it since the return value of `  new_password = gets.chomp` would be new password
#
# # The second method `verify_password` would reise an exception
#   Line 14 it is trying to local variable `password` this variable is first initialized in line 1
#   But method definition will define a new variable scope, the `verify_password` method doesn't require any argument so no local variable would be passed in
#   For these reasons, `password` is not accessible in `verify_password`
#   This will raise exception undefined local variable or method
#
# To fix this, we should adjust the code to lying on appropriate context.
#
# First we let `verify_password` require an argument `password`, and change line 25 to `verify_password(password)`
#
# def verify_password(password)
#   puts '** Login **'
#   print 'Password: '
#   input = gets.chomp
#
#   if input == password
#     puts 'Welcome to the inside!'
#   else
#     puts 'Authentication failed.'
#   end
# end
#
#
# Then in line 21 - 23 when `password` is invalid, it wants to set new password by using `set_password`
# But the `set_password` just return a password, it doesn't set the return value of `password`
#
# To fix this, correct line 22 to `password = set_password`

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)
