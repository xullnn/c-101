### Practice Problem 1

Given the array below

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
```

Turn this array into a hash where the names are the keys and the values are the positions in the array.

- answer

```ruby
flintstones.map.with_index { |word, idx| [word, idx] }.to_h
```

### Practice Problem 2

Add up all of the ages from the Munster family hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

- answer

```ruby
ages.values.sum
```

### Practice Problem 3

In the age hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```
throw out the really old people (age 100 or older).

- answer

```ruby
ages.delete_if { |name, age| age >= 100 }
```

### Practice Problem 4

Pick out the minimum age from our current Munster family hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

- answer

```ruby
ages.values.min
```

### Practice Problem 5

In the array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Find the index of the first name that starts with "Be"

- answer

```ruby
flintstones.find_index { |name| name.start_with?("Be") }
```

### Practice Problem 6

Amend this array so that the names are all shortened to just the first three characters:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

- anwer

`flintstones.map { |name| name[0,3] }`

### Practice Problem 7

Create a hash that expresses the frequency with which each letter occurs in this string:

```ruby
statement = "The Flintstones Rock"
```

ex:

```ruby
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
```

- answer

```ruby
h = Hash.new(0)
statement.each_char { |char| h[char] += 1 }
h
```

### Practice Problem 8

What happens when we modify an array while we are iterating over it? What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
```

- answer

We may get some unpredictable results.

idx = 0, after shift(1) => [2,3,4]
idx = 1, after shift(1) => [3,4]
idx = 2, iteration abort

We get `[3,4]` finnally.

What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```

`[1,2]`

### Practice Problem 9

As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

```ruby
words = "the flintstones rock"
```

would be:

```ruby
words = "The Flintstones Rock"
```

Write your own version of the rails titleize implementation.

- answer

```ruby
def titleize(title)
  title.split.map { |word| word.capitalize }.join(" ")
end
```

### Practice Problem 10

Given the munsters hash below

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below.

```ruby
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
```

Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

- answer

```ruby
munsters.each do |name, infos|
  if infos["age"] <= 17
    infos["age_group"] = "kid"
  else
    if infos["age"] <= 64
      infos["age_group"] = "adult"
    else
      infos["age_group"] = "senior"
    end
  end
end
```

- Given answer (more readable and understandable)

```ruby
munsters.each do |name, infos|
  case infos["age"]
  when 0..17
    infos["age_group"] = "kid"
  when 18..64
    infos["age_group"] = "adult"
  else
    infos["age_group"] = "senior"
  end
end
```
