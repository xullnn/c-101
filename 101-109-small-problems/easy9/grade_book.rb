# understand the problem
  # given 3 arguments, calculating their mean value
  # based on an existing grade standard, report the corresponding grade of the mean value

# Exaples and Test cases
  # get_grade(95, 90, 93) == "A"
  # get_grade(50, 50, 95) == "D"

# Data structure
  # hash
  # integer
  # string

# Algorithm
  # ‘hashilize’ grade standard, key is a range, values is grade string
  # go through standard hash, using `include?` to find grade

GRADES = {
  (90..100) => "A",
  (80...90) => "B",
  (70...80) => "C",
  (60...70) => "D",
  (0...60) => "F"
}


def get_grade(x,y,z)
  mean = ((x + y + z) / 3).round
  GRADES.each { |k, v| return v if k.include?(mean) }
end
