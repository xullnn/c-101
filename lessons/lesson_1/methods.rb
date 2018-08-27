def add(a,b)
  a + b
end

def multiply(x,y)
  x * y
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

# random sentence

def name(names)
  names.sample
end

def activity(activities)
  activities.sample
end

def sentence(a,b)
  "#{a} went #{b} today"
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))
