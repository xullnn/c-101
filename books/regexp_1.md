## 1

Write a method that returns true if its argument looks like a URL, false if it does not.

Examples:

```ruby
url?('http://launchschool.com')   # -> true
url?('https://example.com')       # -> true
url?('https://example.com hello') # -> false
url?('   https://example.com')    # -> false
```

- answer
```ruby
def url?(string)
  regexp = /\Ahttps*:\/\/\S+\z/
  !!(string =~ regexp)
end
```

## 2

Write a method that returns all of the fields in a haphazardly formatted string. A variety of spaces, tabs, and commas separate the fields, with possibly multiple occurrences of each delimiter.

Examples:

```ruby
fields("Pete,201,Student")
# -> ['Pete', '201', 'Student']

fields("Pete \t 201    ,  TA")
# -> ['Pete', '201', 'TA']

fields("Pete \t 201")
# -> ['Pete', '201']
```

- answer

```ruby
def fields(string)
  string.scan /[a-zA-Z0-9]+/
end
```

## 3

Write a method that changes the first arithmetic operator `( +, -, *, / )` in a string to a '?' and returns the resulting string. Don't modify the original string.

Examples:

```ruby

mystery_math('4 + 3 - 5 = 2')
# -> '4 ? 3 - 5 = 2'

mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# -> '(4 ? 3 + 2) / 7 - 1 = 1'
```

- answer



```ruby
def mystery_math(string)
  regexp = /\+|-|\*|\//
  string.sub(regexp, "?")
end
```

## 4

Write a method that changes every arithmetic operator `(+, -, *, /)` to a '?' and returns the resulting string. Don't modify the original string.

Examples:

```ruby
mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'
```

- answer

```ruby
def mysterious_math(string)
  regexp = /[\+\-\*\/]/
  string.gsub(regexp, "?")
end
```

## 5

Write a method that changes the first occurrence of the word apple, blueberry, or cherry in a string to danish.

Examples:

```ruby
danish('An apple a day keeps the doctor away')
# -> 'An danish a day keeps the doctor away'

danish('My favorite is blueberry pie')
# -> 'My favorite is danish pie'

danish('The cherry of my eye')
# -> 'The danish of my eye'

danish('apple. cherry. blueberry.')
# -> 'danish. cherry. blueberry.'

danish('I love pineapple')
# -> 'I love pineapple'
```

- answer

```ruby
def danish(string)
  regexp = /\bapple|cherry|blueberry\b/
  string.sub(regexp, "danish")
end
```

## 6

Challenge: write a method that changes dates in the format 2016-06-17 to the format 17.06.2016. You must use a regular expression and should use methods described in this section.

Example:

```ruby
format_date('2016-06-17') # -> '17.06.2016'
format_date('2016/06/17') # -> '2016/06/17' (no change)
```

- answer

```ruby
def format_date(date)
  if date =~ /\-/
    date.scan(/\d+/).reverse.join(".")
  else
    date
  end
end
```

## 7

Challenge: write a method that changes dates in the format 2016-06-17 or 2016/06/17 to the format 17.06.2016. You must use a regular expression and should use methods described in this section.

Example:

```ruby
format_date('2016-06-17') # -> '17.06.2016'
format_date('2017/05/03') # -> '03.05.2017'
format_date('2015/01-31') # -> '2015/01-31' (no change)
```

- answer

```ruby
def format_date(date)
  regexp = /(\d{4})(\-|\/)(\d{2})\2(\d{2})/
  if date =~ regexp
    date.sub(regexp, '\4.\3.\1')
  else
    date
  end
end
```
