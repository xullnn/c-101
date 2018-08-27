# understand the problem
  # based on:
  # 1. wether all sides are greater than 0
  # 2. if any two sides' length sum is greater than the third
  # to determine the kind of the given triangle

  # then return a descriptive symbol

# Examples and Test cases
  # triangle(3, 3, 3) == :equilateral
  # triangle(3, 3, 1.5) == :isosceles
  # triangle(3, 4, 5) == :scalene
  # triangle(0, 3, 3) == :invalid
  # triangle(3, 1, 1) == :invalid

# Data structure
  # integer

# Algorithm
  # detect invalid: any two sides' length sum is greater than the third
  # equilateral: a == b && b == C
  # isoceles: a == b || b == c || a == c
  # scalene: a != b && a != c && b != c


def triangle(a, b, c)
  if a + b <= c || a + c <= b || b + c <= a
    :invalid
  elsif
    a == b && b == c
    :equilateral
  elsif
    a == b || b == c || a == c
    :isoceles
  elsif
    a != b && a != c && b != c
    :scalene
  end
end
