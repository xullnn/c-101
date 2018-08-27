### Words & Vocabularies

have no notion of  不明白；完全不懂

### Sentences

### Notes

The two major areas where we encounter local variable scoping rules are related to **method definition** and **method invocation with a block**. We'll cover each of these two areas below.

> Inner scope can access variables initialized in an outer scope, but not vice versa.

If we initialize an variable before a block, then we can access(use it or change it) this variable in the block. And of course also after the block.

```ruby
a = 2
3.times do
  a = 5
end
a # => 5
```

But if we initialize an variable into the block, then we try to access it after the block, we will get 'undefine method or variable'.

```ruby
3.times do
  a = 2
end
a # => undefined method or variable
```

**Notice that not all code involving `{}` or `do / end` are count as blocks.** This is a little bit tricky:

```ruby
while n < 3 do
  a = 9
  n += 1
end
# => nil
a
# => 9
```

```ruby
array = [1,2,3]
# => [1, 2, 3]
for element in array do
  x = "string"
end
# => [1, 2, 3]
x
# => "string"
```

> The reason is because the for...do/end code did not create a new inner scope, since for is part of Ruby language and not a method invocation. When we use each, times and other method invocations, followed by {} or do/end, that's when a new block is created.

Cases like `object.each {}` `object.map {}` and `loop`(notice this, it is in the Kernel module), these blocks have a leading method such as `each` and `map` or so. This is where the rule works. Cases like `for .. in` `while` , these are not methods, they are just a part of Ruby language, so the varaibles initialized in them can penetrate the block and are accessible after the block.(This is my current understanding.)


#### Types of variables

There are 5 types of variables:

- constant
- global variable
- class variable
- instance variable
- local variable

**CONSTANT**

**$GLOBAL_VARIABLE**

Constants and global variables are accessible to your entire application.
You should not change a existing constant. Rubyists tend to stay away from global variables.

**@@class_variable**

Class variables are accessible to the class itself and its instances, it's a variable related to a class. If some instances(not all) in a class need a same variable, then you can consider using class variable.

> Class variables must be initialized at the class level, outside of any method definitions. They can then be altered using class or instance method definitions.

**@instance_variable**

> Instance variables are declared by starting the variable name with one @ sign. These variables are available throughout the current instance of the parent class. Instance variables can cross some scope boundaries, but not all of them. You will learn more about this when you get to OOP topics, and should not use instance variables until you know more about them.

**local_variable**

#### block parameters over local variable which has the same name

```ruby
array = [1,2,3]
# => [1, 2, 3]
e = 8
# => 8
array.each do |e|
  puts e
end
1
2
3
# => [1, 2, 3]
e
# => 8


n = 10
# => 10
1.times do |n|
  n = 5
end
# => 1
n
# => 10
```

We should avoid using oversimplified variable names. This is a good way to keep yourself from variable scope problems, also good naming habit can make program easy to read and debug. So make sure you have clear varaible names.

#### Variables and Method Definitions

The only variables a method definition has access to must be passed into the method definition.(Again we are only talking about local variables)

```ruby
a = 'How are you'

def greet
  puts a #
end
# => :greet

greet
# => NameError (undefined local variable or method `a' for main:Object
```

Unless you pass a variable in:

```ruby
def greet(a)
  puts a
end

a = "How are you?"

greet(a)
```

> This is all you need to know with regards to variable scope and method definitions.

#### Blocks within Method Definitions

You can treat the space into method definition as an irb.

#### Constants

Constants have different behavior from local variables. A method can get a constant that are initialized out of the method.

>  It's likely you'll forget these rules, but the most important thing is to be able to quickly jump in irb or open up your editor and refresh your memory.
