### Words & Vocabularies

make certain
 : to do something or find out something so that you have no doubt about whether something is true, correct, will happen, etc.



### Sentences

### Notes

The most common operation on collections are:
- iteration
- selection
- transformation

> Selection and transformation both utilize the basics of looping:       
>> a loop,      
>> a counter,      
>> a way to retrieve the current value,      
>> and a way to exit the loop.  

Keep those four things in mind.

#### Looping to Select and Transform

> When performing transformation, it's always important to pay attention to whether the original collection was mutated or if a new collection was returned.

#### Extracting to Methods

Let's now take a look at an example with hashes. In this example we want to select the key-value pairs where the value is 'Fruit'.

```ruby
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
```

How would you implement a method like this?

```ruby
  def select_fruit(produce)
    produce_arr = []
    idx = 0
    produces = produce.to_a
    while idx < produces.size
      if produces[idx][1] == 'Fruit'
        produce_arr << produces[idx]
      end
      idx += 1
    end
    produce_arr.to_h
  end
```

If we wanted to, we could've easily decided that mutating the method argument is the right approach. Can you implement a double_numbers! method that mutates its argument?

```ruby
def double_numbers!(numbers)
  idx = 0
  while idx < numbers.size
    numbers[idx] = numbers[idx] * 2
    idx += 1
  end
  numbers
end
```

Exercise for the reader: What if we wanted to transform the numbers based on their position in the array rather than their value?

```ruby
def double_odd_index_numbers(numbers)
  new_arr = []
  idx = 0
  loop do
    break if idx >= numbers.size
    new_arr << numbers[idx] * 2 if idx.odd?
    idx += 1
  end
  new_arr
end
```

#### More Flexible Methods

Continuing on with the idea of building generic methods, let's update our double_numbers method to not only be able to double the values in an array, but to multiply by any number. For example, let's create a method called multiply that can take an additional argument to determine the transformation criteria.

```ruby
def multiply(numbers, multiplier)
  new_arr = []
  idx = 0
  loop do
    break if idx >= numbers.size
    new_arr << numbers[idx] * multiplier
    idx += 1
  end
  new_arr
end
```

> Finally, it's common to chain actions on collections; but pay special mind to the return value, especially if the return value is an empty collection or nil. Trying to chain methods on empty collections or nil is dangerous and results in a lot of broken programs.
