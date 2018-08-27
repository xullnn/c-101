### Words & Vocabularies

catch sb off guard : 让...措手不及

unintended : 非计划中的，无意要做的

out of bounds : 超出界限的；
 outside the area where players or the ball must stay in sports like basketball and American football
 not good or acceptable
 used to describe a place where people are not allowed to go

disambiguate : /ˌdɪsæm'bɪɡjuet/
  remove uncertainty of meaning from (an ambiguous sentence, phrase, or other linguistic unit)
  消除（模棱两可的句子、词组或其他语言单位）的歧义

lend itself to: 适合于；适宜于；适用于；

lend colour to: 把话说得象真的一样；使看起来似有可能；渲染；有迹象



### Sentences

---


## Collections Basics

### Element Reference

#### String Element Reference

`str[2,3]` is actually `str.slice(2,3)`

- Question

How would you reference 'grass' from within this string? Try it out in irb.

`str = 'The grass is green'`

- answer

  `str[str.index('g'), 5]`

#### Array Element Reference

  `array[2,3]` is also `array.slice(2,3)`

  Always remember that `array[x,y]` returns new array, while `array[n]` returns single element.

- Question

What do you think would be returned here? Try it out in irb.

```ruby
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3]
arr[2, 3][0]
```

- answer

  `["c", "d", "e"]` and `"c"`

#### Hash Element Reference

- Question

When initializing a hash, the keys must be unique. Try the following code out in irb.

`hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }`

- answer
```ruby
warning: key "fruit" is duplicated and overwritten on line 5
=> {"fruit"=>"pear", "vegetable"=>"carrot"}
```

Key must be unique, if there are same keys appear, the later will overwritten the former.

#### Element Reference Gotchas

**Out of Bounds Indices**

Something like `[1,2,3][9]` will return `nil`.

`[1,2,nil][2]` also can return `nil`.

How can we tell the wether there is a `nil` object in the array or it just out of the array's index range?

We can use `Array#fetch`. By using `fetch` any given 'out of range' index will raise an IndexError exception instead of return a `nil`.

```ruby
[1,2,nil].fetch(2)
# => nil

[1,2,nil].fetch(3)

Traceback (most recent call last):
        3: from /Users/caven/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):4
        1: from (irb):4:in `fetch'
IndexError (index 3 outside of array bounds: -3...3)
```

Deliberately think about your code, when should you use `[]` and when `fetch`.

**Negative Indices**

`-1` represent the last element, `-2` represents the penultimate. But what if:

```ruby
str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6]
arr[-6]
```

I would be `nil`.

**Invalid Hash Keys**

Also, when `Hash#[]` encounters a key which is not in the hash object, it just return a `nil`, you don't konw if there is a key-value pair whose value is `nil`.

In order to make it clearer, we can use `Hash#fetch`, the non-existed key will cause a KeyError exception.

#### Conversion

`Hash#to_a` can convert a hash into a nested array.

Also `Array` has a `Array#to_h` method to convert array to hash

```ruby
arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]

arr.to_h
# => {:name=>"Joe", :age=>10, :favorite_color=>"blue"}

arr = [[:name, 'Joe'], [[:age, 10], [:favorite_color, 'blue']]]

arr.to_h
 => {:name=>"Joe", [:age, 10]=>[:favorite_color, "blue"]}
```

Notice the examples above are all nested arrays with even amount of elements.

If an array is an one-dimension array or has odd amount of elements, the conversion will fail.

```ruby
arr = [:name, 'Joe', :age, 10, :favorite_color, 'blue']

arr.to_h

Traceback (most recent call last):
        3: from /Users/caven/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):36
        1: from (irb):36:in `to_h'
TypeError (wrong element type Symbol at 0 (expected array))
```

#### Element Assignment

**String Element Assignment**

`str[1] = "a"` will mutate the object.

**Array Element Assignment**

```ruby
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]
```

**Hash Element Assignment**
