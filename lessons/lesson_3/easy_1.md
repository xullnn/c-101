### Question 1
  - Since the receiver didn't mutate, it'll stay unchanged.
  - Since we are using `puts`, means 'put string', it'll print one element a line separately
  - The return value is nil

### Question 2
  what is != and where should you use it?
    - Means not equal, it is used to compare whether two objects are the same.
    - If the given objects are comparable, it will return true or false, or it may raise exception.
    - But sometimes it just compare if the two are exactly the same object(they have same object_id)
    - Sometimes(most time) it just compare it the two have same content.
```ruby
one, two = "string", "string"
# => ["string", "string"]
one == two
# => true
one.object_id
# => 70174719906880
two.object_id
# => 70174719906840
```

  put ! before something, like !user_name
    - Logically, it means 'not'.
    - In Ruby, everything but nil and false will be evaluated to true.
    - If we use `!object` Ruby will first evaluate object to true of false, then add the 'not' logic to the results.
    - Based on that, unless `object` is nil or false, all `!object` will return `false`
  put ! after something, like words.uniq!
    - When `!` is at the end of a method name, it actually do nothing, but it do leave us a message that this method is `dangerous`, since it may mutate the caller or arguments been passed in.
    - Not all 'dangerous' methods have this `!` exclamation sign, but all methods that have this `!` are dangerous.
  put ? before something
    - `?` before something can make a single character string. It's a single char literal construction notation of String.
    - The key is "single character", it means `?a` or `?8` works, but `?aa` or `?78` not works.
    - http://ruby-doc.org/core-2.5.1/doc/syntax/literals_rdoc.html
  put ? after something
    - It usually used in method naming, a method end with `?` means it returns boolean value.
  put !! before something, like !!user_name
    - As `!` operator will add a 'not' logic to ruby's evaluation, `!!` means 'not not'...
    - It just turn a object into boolean value.

### Question 3

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."

advice.sub!("important", "urgent")
```

### Question 4

```ruby
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
numbers.delete(1)
```

- `numbers.delete_at(1)` here 'at' is aiming at the caller's index, so it just delete the element whose index is 1, in this case, the second element.
- `numbers.delete(1)` meas delete all `1`s from the caller, in this case, it delete the first element form the caller. But if there are more than one `1`s in the array, all of them will be deleted.

```ruby
nums = [1,2,3,4,1,2]
# => [1, 2, 3, 4, 1, 2]
nums.delete(1)
# => 1
nums
# => [2, 3, 4, 2]
```

### Question 5

  Programmatically determine if 42 lies between 10 and 100.

```ruby
42.between?(10,100)
# => true
(10..100).include? 42
# => true
(10..100).cover? 42
# => true
```

### Question 6

```
famous_words = "Four score and " + famous_words

famous_words = famous_words.prepend("Four score and ")
```

### Question 7

  Fun with gsub:

```ruby
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
# => "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

eval("add_eight(add_eight(add_eight(add_eight(add_eight(number)))))")
# => 42
```

### Question 8

`flintstones.flatten!`

### Question 9

`flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }`

  Turn this into an array containing only two elements: Barney's name and Barney's number

  use `Hash#assoc` : http://ruby-doc.org/core-2.5.1/Hash.html#method-i-assoc

```ruby
# assoc(obj) → an_array or nil
# Searches through the hash comparing obj with the key using ==. Returns the key-value pair (two elements array) or nil if no match is found. See Array#assoc.

flintstones.assoc("Barney")
# => ["Barney", 2]
```
