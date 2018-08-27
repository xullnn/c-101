### Words & Vocabularies

### Sentences

### Notes

#### each

#### select

```ruby
[1, 2, 3].select do |num|
  num + 1
  puts num
end
```

Ruby execute the selection operation based on the **return value of the block**, and it only cares about the truthiness of the return value. In the above example, since `puts`'s return value is always `nil`, the whole program's return value will be an empty array `[]`.

#### map

> The key to remember here is that map always performs transformation based on the return value of the block.

What would the result be?

```ruby
[1, 2, 3].map do |num|
  num.odd?
end
```

Let's check step by step what the return value of the block.

Obviously it could just return `true` or `false`

So the result is `[true, false, true]`

What will the return value of map be in the following example?

```ruby
[1, 2, 3].map do |num|
  num.odd?
  puts num
end
```

`[nil, nil, nil]`


What if:

```ruby
[1, 2, 3].map do |num|
  'hi'
end
```

It's `["hi", "hi", "hi"]`

#### summary

> To further clarify your understanding of these methods and how they work, use the following table as a reference:


|Method|Action|Consider the return value of the block?|Returns a new collection from the method?|Length of the returned collection|
|:-:|:-:|:-:|:-:|:-:|
|each|iteration|No|No, it returns the original|Length of original|
|select|Selection|Yes, its truthiness|Yes|Length of original or less|
|map|Transformation|Yes|Yes|Length of original|

> These methods each utilize the block's return value in their own way. In the case of each, the return value of the block is simply ignored. Before moving forward, it is crucial to understand how exactly these methods use the block's return value to perform their intended task.
