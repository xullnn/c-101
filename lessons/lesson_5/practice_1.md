### Practice Problem 1

How would you order this array of number strings by descending numeric value?

```ruby
arr = ['10', '11', '9', '7', '8']
```

`arr.sort { |a,b| b.to_i <=> a.to_i }`
or
`arr.sort_by { |n| n.to_i }.reverse`

### Practice Problem 2

How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

```ruby
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
```

- answer

sort_by: notice it don not have to convert year into integer

`books.sort_by { |book| book[:published] }`

### Practice Problem 3

For each of these collection objects demonstrate how you would reference the letter 'g'.

```ruby
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
# arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# hsh2[:third].keys[0] or hsh2[:third].key(0) # => "g"
```

### Practice Problem 4

For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

```ruby
arr1 = [1, [2, 3], 4]
# arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
# hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# hsh2['a'][:a][2] = 4
```

### Practice Problem 5

Given this nested Hash:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

figure out the total age of just the male members of the family.

- answer

```ruby
females = munsters.select { |person, info| info["gender"] == "male" }
females.values.map { |info| info["age"] }.sum
```

- given answer

```ruby
total = 0
munsters.each_value do |info|
  total += info["age"] if info["gender"] == "male"
end
total
```

### Practice Problem 6

One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

...like this:
```ruby
(Name) is a (age)-year-old (male or female).
```

- answer

```ruby
munsters.each do |name, infos|
  puts "#{name} is #{infos["age"]}-year-old #{infos["gender"]}"
end
```

### Practice Problem 7

Given this code, what would be the final values of a and b? Try to work this out without running the code.

```ruby
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2 # => [4, [5,8]]
arr[1][0] -= a # => [4, [3,8]]
```

a: 2
b: [3,8]

### Practice Problem 8

Using the each method, write some code to output all of the vowels from the strings.

```ruby
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
```

- answer

```ruby
hsh.each do |_, value|
  value.each do |word|
    if vowel = word.match(/[AOEIUaoeiu]/)
      puts vowel
    end
  end
end
```

- given answer

use `chars` and `include?`

### Practice Problem 9

Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

```ruby
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
```

- answer

```ruby
arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a    
  end
end
```


### Practice Problem 10

Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

```ruby
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
```

- answer

```ruby
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
arr.map do |hash|
  hash.map do |k,v|
    [k, v + 1]
  end.to_h
end
```

### Practice Problem 11

Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

```ruby
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
```

- answer

select

```ruby
arr.map do |sub_arr|
  sub_arr.select do |num|
    num % 3 == 0
  end
end
```

reject

```ruby
arr.map do |sub_arr|
  sub_arr.reject do |num|
    num % 3 != 0
  end
end
```


### Practice Problem 12

Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

```ruby
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
```

- answer

```ruby
new_hash = {}
arr.each do |sub_arr|
  key = sub_arr[0]
  value = sub_arr[1]
  new_hash[key] = value
end
new_hash
```

### Practice Problem 13

Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically according to the numeric value of the odd integers they contain.

```ruby
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
```

The sorted array should look like this:

```ruby
[[1, 8, 3], [1, 6, 7], [1, 4, 9]]
```

- answer

key is how to get the maximal odd number

```ruby
arr.sort_by do |sub_arr|
  sub_arr.select { |num| num.odd? }.max
end
```
- given answer

```ruby
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
```

its idea:

all sub_arr's first two elements don't matter since the first nums are same and the second nums are even.

so it doesn't matter inner select returns an array since comparision between arrays is based on their corresponding elements

so comparing [[3], [7], [9]] is same as comparing [3,7,9]



### Practice Problem 14

Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

```ruby
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
```
The return value should look like this:

```ruby
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
```

- answer

In order to keep the original structure we could use nested map

```ruby
hsh.values.map do |infos|
  if infos[:type] == 'fruit'
    infos[:colors].map { |c| c.capitalize }
  else
    infos[:size].upcase
  end
end
```


### Practice Problem 15

Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

```ruby
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
```

- answer

select + all?

```ruby
arr.select do |hash|
  hash.values.flatten.all? { |n| n.even? }
end
```

- given answer

```ruby
arr.select do |hs1|
  hs1.all? do |_,nums|
    nums.all? { |n| n.even? }
  end
end
```


### Practice Problem 16

A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.

```ruby
def create_uuid
  letters = ('a'..'f').to_a
  nums = (0..9).to_a
  num_sections = [8,4,4,4,12].map do |length|
    length.times.map { [letters,nums].sample.sample.to_s }.join
  end
  num_sections.join("-")
end
```
