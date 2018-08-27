### Question 1

  Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

  For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

```ruby
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
```

`10.times { |n| puts (" " * n + "The Flintstones Rock!") }`

### Question 2

  The result of the following statement will be an error:

  puts "the value of 40 + 2 is " + (40 + 2)
  Why is this and what are two possible ways to fix this?

  String object and Integer object cannot add without conversion `(40 + 2).`to_s

  Or use `puts "the value of 40 + 2 is #{40 + 2}"`


### Question 3

  Alan wrote the following method, which was intended to show all of the factors of input number
```ruby
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
```
  Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using begin/end/until? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

  Bonus 1

  What is the purpose of the number % dividend == 0 ?

  Bonus 2

  What is the purpose of the second-to-last line in the method (the divisors before the method's end)?

- anwer:

  `begin` is a keyword that used for handling exception

  http://ruby-doc.org/core-2.5.1/doc/syntax/exceptions_rdoc.html

> If you are inside a method, you do not need to use begin or end unless you wish to limit the scope of rescued exceptions:

  There are several errors in the original code:

  1 Dividend is the number that is going to be divided by another one, for example in `8/3`, `8` is the dividend, so `dividend` may cause confusion. It should be `factor`.

  2 The code's idea is divide the number by from itself to 0, for example if number is `8`, it would do `8/8`, `8/7`, `8/6` before `8/0`(`8/0` will not be executed). Whenever the `number % factor == 0` this factor should be pushed to the array.

  3 `begin` is a keyword that used for handling exception, it's unnecessary to use `begin` here, unless you want to do something wiht possible exceptions.

```ruby
# without loop
def factors(number)
  (1..number).each.with_object([]) { |n, factors| factors << n if number % n == 0 }
end

# with loop
def factors(number)
  factors = []
  factor = number
  while factor >= 1
    factors << factor if number % factor == 0
    factor -= 1
  end
  factors
end
```


### Question 4

  Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

  She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```

- answer

  The first method will mutate the caller, the second will not since the `input_array + [new_element]` will return a new array,  `buffer = input_array + [new_element]`  is a reassignment operation.


### Question 5
  Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator, A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

  Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

  limit = 15
```ruby
def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

  How would you fix this so that it works?

- answer

The `limit` variable is out of `fib`'s variable scope, we should include the `limit` as one of the arguments been passed in.


### Question 6

  In an earlier practice problem we saw that depending on variables to be modified by called methods can be tricky:

```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

  We learned that whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.

  How can we refactor this practice problem to make the result easier to predict and easier for the next programmer to maintain?

- answer

  1 First, we should be clear wether a method is used to return a value or print out some message. In this case, it seems want to return value. But one method can only returns one value and just do one thing. So I think first we should split it into 2 separate methods.

  2 Some methods will mutate the arguments some will not, if they do we should label it with a following `!`.

  So I may do this:

```ruby
def add_suffix(word)
  word += "rutabaga"
end

def add_array!(arr)
  arr << ["pumpkins"]
end
```

 The given answer change the `an_array_param << "rutabaga"` to `an_array_param += ["rutabaga"]` then return the two objects in one line: ` return a_string_param, an_array_param`

 This reminded me that we'd better avoid changing the arguments immediately in the method.


### Question 7

 What is the output of the following code?

```ruby
answer = 42

def mess_with_it(some_number)
   some_number += 8
end

new_answer = mess_with_it(answer)
p answer - 8
```

- answer

the `answer` variable is out of the method's scope. Since calling the method has no effect on it, so answer-8 is equal to 42-8


### Question 8

  One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

```ruby
munsters = {
  "Herman" => { "age" => "male" },
  "Lily" => { "age" => "female" },
  "Grandpa" => { "age" => "male" },
  "Eddie" => { "age" => "male" },
  "Marilyn" => { "age" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

  After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

  `mess_with_demographics(munsters)`

  Did the family's data get ransacked? Why or why not?

- answer

  Yes.

  **given answer**
  Spot will find himself in the "dog" house for this one. The family's data is all in shambles now.

  Why? Remember that in Ruby, what gets passed in the parameter list is not what it appears. Under the hood, ruby passes the object id of each item rather than the value of the parameter. The method internally stores these object id's in locally scoped (private to the method) variables (named per the method definition's parameter list).

  So Spot's demo_hash starts off pointing to the munsters hash. His program could wind up replacing that with some other object id and then the family's data would be safe.

  In this case, the program does not reassign demo_hash -- it just uses it as-is. So the actual hash object that is being messed with inside of the method IS the munsters hash.

  **my understanding**

  The given answer's main idea is the when the hash object passed in, the method didn't make a copy of the original hash, it just uses it as it is, so all the changes have been kept.

  But at first I thought the answer is no. Because `demo_hash.values` is a different object.

```ruby
  munsters.object_id
 => 70358153687420
munsters.values.object_id
 => 70358170432400
```

But then I did this:

```ruby
munsters.values.each do |hash|
  p hash, hash.object_id
end

{"age"=>32, "gender"=>"male"}
70358153688580
{"age"=>30, "gender"=>"female"}
70358153688040
{"age"=>402, "gender"=>"male"}
70358153687780
{"age"=>10, "gender"=>"male"}
70358153687600
{"age"=>23, "gender"=>"female"}
70358153687460
 => [{"age"=>32, "gender"=>"male"}, {"age"=>30, "gender"=>"female"}, {"age"=>402, "gender"=>"male"}, {"age"=>10, "gender"=>"male"}, {"age"=>23, "gender"=>"female"}]

munsters.each do |name, hash|
  p hash, hash.object_id
end

{"age"=>32, "gender"=>"male"}
70358153688580
{"age"=>30, "gender"=>"female"}
70358153688040
{"age"=>402, "gender"=>"male"}
70358153687780
{"age"=>10, "gender"=>"male"}
70358153687600
{"age"=>23, "gender"=>"female"}
70358153687460
 => {"Herman"=>{"age"=>32, "gender"=>"male"}, "Lily"=>{"age"=>30, "gender"=>"female"}, "Grandpa"=>{"age"=>402, "gender"=>"male"}, "Eddie"=>{"age"=>10, "gender"=>"male"}, "Marilyn"=>{"age"=>23, "gender"=>"female"}}
```

Although `munsters.values` returns an array, but no matter what is this array's object_id, every single hash element in the array is same as the ones in the original hash. The array object is just a container, the elements are pointing to `munsters`'s keys, they are same. The method mutates the hash object from a atomic level, since these basic hashes have been changed, all the variables or any other pointers that pointing the these objects are changed.

### Question 9

  Method calls can take expressions as arguments. Suppose we define a function called rps as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.

```ruby
  def rps(fist1, fist2)
    if fist1 == "rock"
      (fist2 == "paper") ? "paper" : "rock"
    elsif fist1 == "paper"
      (fist2 == "scissors") ? "scissors" : "paper"
    else
      (fist2 == "rock") ? "rock" : "scissors"
    end
  end
```

  What is the result of the following call?

  `puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")`

  - answer

  It's `paper`.

  From the inside to out step by step:

```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

puts rps(rps("paper", "rock"), "rock")

puts rps("paper", "rock")

# => "paper"
```

### Question 10

  Consider these two simple methods:

```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```

What would be the return value of the following method invocation?

`bar(foo)`


```ruby
# step 1
foo #=> "yes"

# step 2
bar("yes") => "no"
```
