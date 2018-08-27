### Words & Vocabularies

### Sentences

### Notes

#### Enumerable#any?

http://ruby-doc.org/core-2.5.1/Enumerable.html#method-i-any-3F

#### Enumerable#all?

http://ruby-doc.org/core-2.5.1/Enumerable.html#method-i-all-3F

#### Enumerable#each_with_index

http://ruby-doc.org/core-2.5.1/Enumerable.html#method-i-each_with_index

Notice the case with hash, the block will take 2 block parameters, first is an array containing the key-value pair, the second is index.

#### Enumerable#each_with_object

http://ruby-doc.org/core-2.5.1/Enumerable.html#method-i-each_with_object

Also notice hash. There are two formats to pass block parameters:

If you only pass two block parameters, the behavior would like it did in `each_with_index`

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
# => ["ant", "bear", "cat"]
```

If use `|(k,v), object|`, the operation will be more accurate.

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }
```

#### Enumerable#first

http://ruby-doc.org/core-2.5.1/Enumerable.html#method-i-first

> There are a couple of interesting things of note here.

> First, hashes are typically thought of as unordered and values are retrieved by keys. In some programming languages, the order is not preserved at all. This used to be true for Ruby too, but since Ruby 1.9, order is preserved according to the order of insertion. Calling first on a hash doesn't quite make sense, but Ruby lets you do it.

> Second, notice that the return value of calling first on a hash with a numeric argument is a nested array. This is unexpected. Fortunately, turning this nested array back to a hash is easy enough: [[:a, "ant"], [:b, "bear"]].to_h.

> In practice, first is rarely called on a hash, and most often used with arrays.

#### Enumerable#include?

When called on a hash, include? only checks the keys, not the values. `Hash#include?` and `Hash#key?` and `Hash#has_key?` are alias.

We can use `Hash#has_value?` or `Hash#value?` to check there is a specific value exists.

#### Enumerable#partition

Notice how the 'break point' determines.

```ruby
[ 5 }
 => [[6, 7], [2, 3, 4, 5]]
[2,3,4,5,6,7].partition { |n| n < 5 }
 => [[2, 3, 4], [5, 6, 7]]
```

The most idiomatic way to use partition is to parallel assign variables to capture the divided inner arrays:

```ruby
odd, even = [1, 2, 3].partition do |num|
 num.odd?
end

odd  # => [1, 3]
even # => [2]
```

No matter what is the receiver, the return value will always be array.

```ruby
long, short = { a: "ant", b: "bear", c: "cat" }.partition do |k,v|
  v.length > 3
end
# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]

long
# => [[:b, "bear"]]
short
# => [[:a, "ant"], [:c, "cat"]]
```


### Charts

|||||||
|:-:|:-:|:-:|:-:|:-:|:-:|
|||||||
|||||||
|||||||
|||||||
|||||||
