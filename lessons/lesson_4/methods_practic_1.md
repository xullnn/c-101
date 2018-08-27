### Practice Problem 1

What is the return value of the select method below? Why?

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

`select` will 'collect' the current elememt when the block's return value evaluate to `true`.
Since the last line in the block is `hi`, which will be evaluated to `true` within every iteration step.
So the final return value is `[1,2,3]`

### Practice Problem 2

How does count treat the block's return value? How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

From the doc:
> If a block is given, counts the number of elements for which the block returns a true value.

Every time the block returns `true`, the count will +1. So here is `2`

### Practice Problem 3

What is the return value of reject in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

`Array#reject` will kick an element out when the block returns true.
Since `puts`'s return value is always `nil` which will be evaluated to `false`, so all the elements were kept.

### Practice Problem 4

What is the return value of each_with_object in the following code? Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

Here `value` points to single string, hash points the the hash object been passed in.
So `value[0]` will be the first char of every string `a`, `b`, `c`
Therefore it will produce key-value pairs whose key is the first char of the word and the value is the whole word.
And of course they are in the hash object.

### Practice Problem 5

What does shift do in the following code? How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

http://ruby-doc.org/core-2.5.1/Hash.html#method-i-shift

It popped out the first kay-vale pair and encapsulate them in to an array.

Notice when the hash is empty, `shift` will not return an empty array, it will return the default value of the hash or `nil`(actually the nil are default default value.)

```ruby
h = Hash.new("Hiding")
# => {}
h.shift
# => "Hiding"

h = {}
#  => {}
h.shift
#  => nil
```

### Practice Problem 6

What is the return value of the following statement? Why?

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

`11`

### Practice Problem 7

What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

The block's return value is alternative `true` and `fales`, since `num.odd?` is in the last line of the block.
The return value of `any?` is true, cause once the block returned a `true` the `any?` will return `true.`


### Practice Problem 8

How does take work? Is it destructive? How can we find out?

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

It's not, because after the operation above, the `arr` are not changed.

### Practice Problem 9

What is the return value of map in the following code? Why?
```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

It's `[nil, 'bear']`.
`map` is a transformation operation method, it collection all the return value of every iteration step.
The `if...end` will return nil when the condition are missed.

```ruby
if false
end
# => nil
```


### Practice Problem 10

What is the return value of the following code? Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

`[1,nil,nil]` just always remember that `puts`'s return value is `nil`.

### summary

The key things to think about are:

- How does the method treat the block's return value?
- What is the return value of the method?
- How can you use the Ruby docs to learn more about a method?
- Is the method destructive?
