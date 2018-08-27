### Words & Vocabularies

algorithmically (重音在 'r): 从算法上，在算法上，以算法的方式

under the hood of : 在...的表面之下

viewed in isolation : 孤立地看待, 单独地看待

precede : v. 时间上早于; 位置上或顺序上先于 a precedes b



### Sentences

### Notes

#### Comparision

> Comparison is at the heart of how sorting works.

#### The <=> Method

Ruby use `<=>` to determine the comparing criteria between different objects in the collection.

> Any object in a collection that we want to sort must implement a <=> method. This method performs comparison between two objects of the same type and returns a -1, 0, or 1, depending on whether the first object is less than, equal to, or greater than the second object; if the two objects cannot be compared then nil is returned.

```ruby
2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil
```

Sorting methods in fact don't care about the underlying sorting algorithm, they just focus on the return value of `<=>`, that is what they depend on to sort the objects.

**ASCII Table**

> Concepts like greater than, less than and equal to are fairly obvious when dealing with integers; but how does the String#<=> understand these concepts? The answer is that String order is determined by a character's position in the ASCII table.

We can get the ordinal number of a character in the ASCII table with `ord` method, or in opposite direction we can get a character by giving its ordinal number then use `chr` method

```ruby
"f".ord
# => 102
102.chr
# => "f"
```

Based on this ordinal number of each character, the `<=>` method return the result of comparision. Obviously we do not need to remember the whole table, but there are some basic rules:

- Uppercase letters come before lowercase letters
- Digits and (most) punctuation come before letters
- There is an extended ASCII table containing accented and other characters - this comes after the main ASCII table

#### The sort method

Comparing single chars is easy. But how it would be when comparing strings containing multiple chars. For example "abcde" and "fghijk"?

Some pseudo code to explain the rule:
```
First compare the first char
  IF two strings have different starting char, that will be the sorting criteria
  IF the first chars are same, then comparing the second char, apply the same rule in the first step, until a different char is been encountered

  IF all the chars are the same `<=>` returns 0
  IF the first n chars are same but one of the strings's has a bigger length, then it will be evaluated to the greater one.
```

How about comparing arrays, the rule employed on array has roughly the same 'sense' of that of strings. It starts with character level. Assuming we have a nested array, the sub arrays contains multiple chars strings.

```
First take out the elements whose index are 0
Then comparing these two strings by using the rule we mentioned in string's comparision
Whenever it came out a non-zero result, the whole sub array will be sorted based on that result.
IF the first n elements are same, then it will continuing to compare the rest.
IF the first n elements are all same, but one sub array contains one more element, then it will evaluated to the greater one.
```

The rules employed on array are similar in a recursive sense to string's comparing rules, it just add an additional encapsulation.

#### The sort_by method

`sort_by` allows us to determine what we want to compare.

```ruby
people.sort_by { |name,age| age }
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]
```

Notice that `sort_by` always returns an array.

#### Other methods which use comparison

- min
- max
- minmax
- min_by
- max_by
- minmax_by

### Summary

- Sorting methods are depending on the return value of `<=>`
- How `<=>` implement comparision logic is depending on how it been defined in specific class
- Be aware of the recursive sense of comparing rules
