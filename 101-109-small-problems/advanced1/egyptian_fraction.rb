# Understand the problem
  # Rational number: any number that can represented by two integers' quotient or fraction
  # Unit fraction: a rational number that has a numerator 1
  # egyptian fraction: sum of a set of unit fractions

  # A conclusion: any rational number can represented by a series of egyptian fraction

  # Method 1:
    # given a rational number, return correlating egyptian fraction

  # Method 2:
    # given a set of egyptian fraction
    # return correlating rational number

# Examples and Test cases
  # egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
  # egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
  # egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
  #
  # unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
  # unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
  # unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
  # unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
  # unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
  # unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
  # unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
  # unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# Data structure
  # Rational object
  # Integer

# Algorithm

  # Say the given number is R
  # first looping from 1 to infinity:
    # 1/1 + 1/2 + ... 1/n at this point
    # he sum > R then break loop
  # change the last fraction in (1/1 + 1/2 + ... 1/n) to 1(n+1)
  # if the sum still > R
  # repeat the above process until the sum == R


def egyptian(rational)
  fractions = []
  n = 1
  until fractions.sum == rational
    if fractions.sum < rational
      fractions << Rational(1,n)
      n += 1
    elsif fractions.sum > rational
      n = fractions.last.denominator
      n += 1
      fractions[-1] = Rational(1,n)
    end
   end
   fractions.map(&:denominator)
end

def unegyptian(denominators)
  denominators.map { |d| Rational(1,d) }.sum
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)


# standard solution
# the basic idea is same but more concise more effective

def egyptian(rational)
  denominators = []
  n = 1
  until rational == 0
    if rational - Rational(1,n) >= 0
      denominators << n
      rational -= Rational(1,n)
    end
    n += 1
  end

  denominators
end
