# understand the problem
  # a method take 2 arguments: 1 array , 1 hash
    # the array contains a person's name components
    # the hash contains its title and occupation
  # combining these information into a sentence

# Examples and Test cases
  # greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
  # => Hello, John Q Doe! Nice to have a Master Plumber around.

  # what if the person doesn't have a middle name

# Data structure
  # string, hash , array

# Algorithm
  # use join(" ") to produce name
  # string interpretation to tackle title and occupation

def greetings(name, job)
  full_name = name.join ""
  occupation = job.values.join " "
  "Hello, #{full_name}! Nice to have a #{occupation} around."
end
