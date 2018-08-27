### Words & Vocabularies

under your belt :  as an achievement or as part of your experience
掌握或拥有了某些成就或技能或经验

nit-picky : 挑剔，吹毛求疵


### Sentences

### Notes

#### Using new lines to organize code

> Making your code readable is of paramount importance, not only for others, but for future self.

#### Should a method return or display?

> Understand if a method returns a value, or has side effects, or both.

Normally a method may:
- return a value
- put some message out (side affect: the return value of `puts` is `nil`)
- mutate some object(receiver or argument)

Possible side effects:

```ruby
# puts result but finally return nil
def total(num1, num2)
  puts num1 + num2
end

# just return a result integer
def total(num1, num2)
  num1 + num2
end
```

Mutate or not:

```ruby
# returning object is not arr1, it's a new array(a copy)
def add(arr1, element)
  arr1 + [element]
end

# arr1 has been changed, and the returning object is arr1 itself
def add(arr1, element)
  arr1 << element
end
```

#### Name methods appropriately

A method's name should show its intention straightforwardly.

If the methoed is aimd for print out some message, add a relevant prifix such as `print_`, `display_`. Thus in the furture when you look backwards, you could promptly know this method is used for print out message, not for returning value.

> If you find yourself constantly looking at a method's implementation every time you use it, it's a sign that the method needs to be improved.

> All this goes back to one bit of advice: **a method should do one thing, and be named appropriately.**

Always make sure your method just do one thing a time.

#### Don't mutate the caller during iteration

```ruby
words = %w(one two three four five six)
# => ["one", "two", "three", "four", "five", "six"]
words.each do |e|
  words.delete(e)
end
# => ["two", "four", "six"]
```

You may allow to mutate single element in the collection while iterating, but do not mutate the collection(caller) itself.

#### Variable shadowing

This is about variable scope rule: inside over outside.

```ruby
name = "bob"
%w(caven lily sam).each do |name|
  puts "#{name} and #{name} are friends."
end
```

The `|name|` covers the `name` outside the block.

#### Don't use assignment in a conditional

It may cause confusion, so we not recommend to do this.

```ruby
  if valid_number = get_number_from_somewhere # only return number or nil
    # do something
  else
    # do something
  end
```

This works but hard to understand, for others as well as for the further self.

```ruby
numbers = [1,2,3,4,5]
while number = numbers.shift
  puts number * 2
end
```

> However, we still recommend that you don't do this.

#### Use underscore for unused parameters

```ruby
collection.each.with_index do |_, idx|
  puts "# #{idx+1} checked!"
end
```

#### Gain experience through struggling

> We can't say this enough: spend the time programming. Learn to debug through problems, struggle with it, search for the right terms, play around with the code, and you'll be able to transform into a professional developer. Because that's exactly what professional developers do on a daily basis.
