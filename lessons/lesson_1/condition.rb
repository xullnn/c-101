# unpredictable weather 1
# def report_weather
#   sun = ['visible', 'hidden'].sample
#   sun == 'visible' ? "The sun is so bright!" : "It's cloudy."
# end
#
# report_weather

# unpredictable weather 2

# def report_weather
#   sun = ['visible', 'hidden'].sample
#   unless sun == 'visible'
#     "The clouds are blocking the sun!"
#   else
#     "The sun is so bright!"
#   end
# end
#
# report_weather

# unpredictable weather 3
  # sun = ['visible', 'hidden'].sample
  # "The clouds are blocking the sun!" unless sun == 'visible'
  # "The sun is so bright!" if sun == "visible"

# true or false
# boolean = [true, false].sample
# # notice here the parenthesis must be used
# boolean ? print("I'm true") : print("I'm false.")

# truthy number
# except for nil and false, in ruby, other objects are all evaluated to true

# stoplight 1

# stoplight = ['green', 'yellow', 'red'].sample
#
# case stoplight
# when 'green'
#   puts "Go!"
# when 'yellow'
#   puts "Slow down."
# when 'red'
#   puts "Stop!"
# end
#

# stoplight = ['green', 'yellow', 'red'].sample
# if stoplight == 'green'
#   puts "Go!"
# elsif stoplight == 'yellow'
#   puts "Slow down."
# else
#   puts "Stop!"
# end

# status = ['awake', 'tired'].sample
#
# alert = if status == 'awake'
#           "Be productive!"
#         else
#           "Go to sleep!"
#         end
#
# puts alert


# cool numbers
# `=` is assignning method, except we are assignning nil or false to a variable
# this expression will always evaluate to true

# stoplight 3
# stoplight = ['green', 'yellow', 'red'].sample
#
# case stoplight
# when 'green'  then puts "Go!"
# when 'yellow' then puts "Slow down!"
# when 'red'    then puts "Stop!"
# end

stoplight = ['green', 'yellow', 'red'].sample
case stoplight
when 'green' ; puts "Go!"
when 'yellow'; puts "Slow down!"
when 'red'   ; puts "Stop!"
end
