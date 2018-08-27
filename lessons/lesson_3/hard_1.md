Question 1

  What do you expect to happen when the greeting variable is referenced in the last line of the code below?

```ruby
if false
  greeting = “hello world”
end

greeting
```

- answer
  Mine: Since the code between `if...end` would never been executed, so this would raise and exception. (WRONG)

  Given: greeting is nil here, and no "undefined method or local variable" exception is thrown. Typically, when you reference an uninitialized variable, Ruby will raise an exception, stating that it’s undefined. However, when you initialize a local variable within an if block, **even if that if block doesn’t get executed**, the local variable is initialized to nil.


Question 2

  What is the result of the last line in the code below?

```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```

- answer

Mine: It should be `{:a => "hi there"}`. The object changed, the pointer did not change.

Question 3

  In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

  To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

  What will be printed by each of these code groups?

A)
```ruby
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

- answer

  Mine: Nothing changed.

B)
```ruby
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

- answer

  Mine: Nothing changed.

C)
```ruby
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

- answer

  Mine: one, two, three has changed to "two", "three", "one", since `gsub!` will mutate the original object.

Question 4

  Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a valid ip address number and asked Ben to use it.

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
```
  Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

  Help Ben fix his code.

- answer

  Mine: To fix false condition just change `break` to `return false`, but why the code cannot handle the input more or fewer than 4 components?

  Given: input more or fewer than 4 components are **invalid**... in...valid ... means not valid

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
```
