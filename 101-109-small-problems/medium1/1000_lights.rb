# understand the problem
  # method only take one argument n
  # this 'n' both represent the number of the lights and the repetition times

  # round 1: from 1st light toggle a light at every 1 step
  # round 2: from 2nd light toggle a light at every 2 step
  # round 3: from 2rd light toggle a light at every 3 step
  # ...


# Examples and TEst cases
  #
  # lights_on(5) => [1,4]
  # lights_on(1) => [1]

# Data structure
  # array
  # integer

# Algorithm

  # use an array to trace how many times we toggle a light
    # every time we toggle a light, we push its number into the array
    # finally check every light's toggle times
      # if the times is odd? then it's on, or it's off

def lights_on(n)
  toggles = []
  (1..n).each {|x| toggles += (x..n).step(x).to_a }
  toggles.uniq.keep_if do |x, arr|
    toggles.count(x).odd?
  end.sort
end

# Another algorithm
  # to make the method more understandable wo can make a hash to simulate the lights
  # in the hash use number as key, true / false as value
  # method `assemble_lights(n)` to generate hash { 1=>false, 2=>false, 3=>false ... }
  # following the rule, go go through the hash
    # (1..n).each do |x|
    #   (x..n).step(x).each do |t|
    #     hash[t] = !hash[t]
    #   end
    # end
  # hash.keep_if { |k, v| v == true }.keys

def assemble_lights(n)
  h = {}
  (1..n).each { |x| h[x] = false }
  h
end

def lights_on(n)
  lights = assemble_lights(n)
  (1..n).each do |x|
    (x..n).step(x).each do |t|
      lights[t] = !lights[t]
    end
  end
  lights.keep_if { |k, v| v == true }.keys
end
