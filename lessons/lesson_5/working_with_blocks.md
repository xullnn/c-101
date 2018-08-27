### Words & Vocabularies

### Sentences

### Notes

Example 3

Explain the code below into tabular format:

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

|Line|Action|Object|Side Effect|Return Value|Is return value used?|
|:-:|:-:|:-:|:-:|:-:|:-:|
|1|map|caller array|no|[1,3]|no,but showed at last|
|1-4|block execution|sub-arrs|no|every first element of sub-arrs|yes,all passed in a new array|
|2|first|each sub-arr|no|first element|yes, as `puts`'s argument|
|2|puts|every first element of sub-arrs|outputs a string representation of an integer|nil|no|
|3|first|sub-arr|no|every first element of sub-arrs|yes, as the final return value of block|

Example 4
Here's another example.

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

|Line|Action|Object|Side Effect|Return Value|Is return value used?|
|:-:|:-:|:-:|:-:|:-:|:-:|
|1|=|return value of method call|no|`[[18, 7], [3, 12]]`|yes, assign to my_arr|
|1|each|`[[18, 7], [3, 12]]`|no|`[[18, 7], [3, 12]]`|yes, assign to my_arr|
|1-7|block execution|sub arrs|no|`[18, 7]` and `[3, 12]`|no|
|2|each|each sub arr|no|`[18, 7]` and `[3, 12]`|yes, as inner `each`'s return value|
|2-6|block execution|each integer in sub arrs|print out nums that are > 5|nil|no|
|3-5|condition control|comparing result of `num>5`|only when `num>5` evaluated to `true` the inner code would be execute|always `nil`(for this particular case).When false `nil` is from conditional expression, when true `nil` is from return value of `puts`|yes, as return value of block|
|3|`>`|current num and 5|no|boolean|yes, used as criteria of `if` statement|
|3-5|puts(conditionally)|nums that are > 5|no|nil|yes, as part of block's return value|

Example 5
Next, let's tackle a slightly more complex example.

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

|Line|Action|Object|Side Effect|Return Value|Is return value used?|
|:-:|:-:|:-:|:-:|:-:|:-:|
|1|map|`[[1, 2], [3, 4]]`|no|`[[2, 4], [6, 8]]`|yes as final return value|
|1-5|block execution|sub arr|no|[2,4] and [6,8]|yes form the final return value|
|2-4|map|each sub arr|no|[2,4] and [6,8]|yes as the outer blocks return value|
|2-4|block execution|intgers in sub arrs|no|2,4 and 6,8|yes as return value of block|
|3|*|num and 2|no|doubled integers|provide as the return value of every inner block execution|

Example 6

Let's mix it up now with some variation. In the below example, we have an array of hashes, and we want to select all elements where every key matches the first letter of the value. Note that the keys are symbols here, so we'll have to do some conversion before comparison.

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

|Line|Action|Object|Side Effect|Return Value|Is return value used?|
|:-:|:-:|:-:|:-:|:-:|:-:|
|1|select|caller arr|no|new_arr containing selected hashes|no|
|1-5|block execution|every hash element in arr|no|single hash or nothing|yes, form the final selection result|
|2|all?|every hash element in arr|no|boolean|yes, used by outer select block|
|2-4|inner block call|every key-value pair in single hash|no|boolean|yes determins the result of `all?` method|
|3|`String#[]`|values of hashes|no|first letter of value|yes, as caller of `==` method|
|3|`Symbol#to_s`|keys of hashes|no|string representation of key|yes as argument of `==` method|
|3|`==`|first letter of value and string format key|no|boolean|determines whether a hash would be selected(unless every iteration in current hash returns true, or it would be abandoned)|

Example 10

Let's say we have the following data structure of nested arrays and we want to increment every number by 1 without changing the data structure.

```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```

`[[[2, 3], [4, 5]], [6, 7]]`


|Line|Action|Object|Side Effect|Return Value|Is return value used?|
|:-:|:-:|:-:|:-:|:-:|:-:|
|1|outer map|`[[[1, 2], [3, 4]], [5, 6]]`|no|2 elements arr|as final return value|
|1-11|outer block call|first level sub arr|no|[[2, 3], [4, 5]] and [6,7]|yes, as block's return value which will be inserted into outer arr container|
|2|map|each first level sub arr|no|arr|yes it served as return value of outer block's return value|
|2-10|second level block call|one dimensional arr or integer|no|two arrs both contains 2 elements|arr of integer|
|3-9|if/else conditional expression|boolean value of `el.to_s.size == 1`|no|no|no|
|3|to_s|second level sub arr of integer|no|string representation of arr or integer|yes as `size`'s caller|
|3|size|string representation of second level sub arr or integer|no|char length of object|yes as `==` method's caller|
|3|`==`|char length and 1|no|boolean|yes used by if/else expression|
|4|`+`|second level integer and 1|no|integer that is 1 bigger than original one|yes as part of second level block's return value|
|6|map|second level sub arr|no|1 dimensional arr|yes as part of second level block's return value|
|6-8|third level block call|integers in second level sub arrs|no|integer that is 1 bigger than original one|yes as third level map's return arr's elements|
|7|'+'|integer and 1|no|bigger integer|yes as return value of third level's blocks return value|



|Line|Action|Object|Side Effect|Return Value|Is return value used?|
|:-:|:-:|:-:|:-:|:-:|:-:|
|||||||
|||||||
|||||||
|||||||
|||||||
