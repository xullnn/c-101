### Question 1

  In this hash of people and their age, see if "Spot" is present.

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages["Spot"]
ages.key?("Spot")
ages.include?("Spot")
ages.member?("Spot")
ages.find { |k,_| k == "Spot" }
```

### Question 2

  Starting with this string:

```ruby
munsters_description = "The Munsters are creepy in a good way."

# convert to
# "The munsters are creepy in a good way."
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

```ruby
munsters_description.capitalize # capitalize!
munsters_description.swapcase  # swapcase!
munsters_description.downcase # downcase!
munsters_description.upcase # upcase!
```

### Question 3

  We have most of the Munster family in our age hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```

`merge` or `merge!`

### Question 4

  See if the name "Dino" appears in the string below:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

`advice.match("Dino")` => nil
`advice.include?("Dino")` => false

### Question 5

  Show an easier way to write this array:

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

`%w(Fred Barney Wilma ....)`
```

### Question 6

  How can we add the family pet "Dino" to our usual array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

`push`, `<<` or `prepend`

### Question 7

  In the previous practice problem we added Dino to our array like this:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```

We could have used either Array#concat or Array#push to add Dino to the family.
How can we add multiple items to our array? (Dino and Hoppy)

```ruby
# use push
flintstones.push("Dino", "Hoppy")

# use concat
flintstones.concat(["Dino", "Hoppy"])
```

### Question 8

  Shorten this sentence:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

  ...remove everything starting from "house".

  Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

  As a bonus, what happens if you use the String#slice method instead?

```ruby
advice.slice!(0, advice.index('house'))
advice.slice!(/^.+house\s/)
```


### Question 9

  Write a one-liner to count the number of lower-case 't' characters in the following string:

```ruby
statement = "The Flintstones Rock!"
#
statement.count('t')
```

### Question 10

  Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?

```ruby
title = "Flintstone Family Members"

title.center(40)
```
