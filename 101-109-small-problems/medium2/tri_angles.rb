# understand the prolem
  # given 3 angles of a triangle
  # based on:
    # 1. sum of angles must be 180
    # 2. no angles can be 0
  # to determine wether it's a valid one

  # then
    # based on given rules to return a descriptive symbol which describe the kind of the triangle
    # this detecting process should start with the most special kinds (right, and obtuse) to the general ones(acute)
      # because among valid ones, in the most special cases we just need one met condition to determine the kind
      # this order will make logic simpler

# Examples and text cases
  # right One angle of the triangle is a right angle (90 degrees)
  # acute All 3 angles of the triangle are less than 90 degrees
  # obtuse One angle is greater

# Data structure
  # integer
  # array [a, b, c] to represents the 3 angles

# Algorithm
  # first detect invalid:
    # array.sum != 180 || array.any? { |angle| angle <= 0 }
  # sort
    # array.one? { |angle| angle == 90 }
    # array.one? { |angle| angle < 90 }
    # else

def triangle(a, b, c)
  angles = [a, b, c]
  if angles.sum != 180 || angles.any? { |angle| angle <= 0 }
    :invalid
  elsif
    angles.one? { |angle| angle == 90 }
    :right
  elsif
    angles.one? { |angle| angle > 90 }
    :obtuse
  else
    :acute
  end
end
