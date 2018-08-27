### Words & Vocabularies

file ... away: 归档；把文件放到正确的位置
get burned into the long term memory: 刻入长期记忆
retain : 留存
in/for/over the long haul: 长期来看
hard-code: v.
  (Computing)fix (data or parameters) in a program in such a way that they cannot easily be altered by the user
  (计算机)将（数据，参数）设为内码
compartmentalize: divide into discrete sections or categories 分隔；划分，区划
taxing: physically or mentally demanding （体力，智力上）繁重的，累人的
convoluted /'kɑnvəlutɪd/ (chiefly technical)intricately folded, twisted, or coiled
  (主技)（错综复杂地）折叠的；扭曲的；盘绕的
miscellaneous /'mɪsə'lenɪəs/ :  of various types or from different sources
 （人，物）混杂的；各种各样的
terse : 简短的，简要的，简明的
clarity over terseness: 清晰比简短重要
reason: ]think, understand, and form judgements by a process of logic
  推论，推理，作逻辑思维
surface: v. 升到（或出现在）水面（或地面）; come to people's attention; become apparent
引起注意；公开化

### Sentences

### Notes

#### Dramatic Experience and Retaining Knowledge

All the time you thought was been 'wasted' on debugging is not useless. The more
emotion you experienced the longer it can retain in your brain.

> We want to encourage you to think about debugging from that perspective - embrace your burns and remember their lessons.

#### Naming things

Unless a variable has a very short lifespan for example in a block or just a few lines,
we should come up with descriptive names for variables.

> In programming, naming things is very hard. Unfortunately, this problem isn't obvious when you write small programs, but it really impedes flow when you're working on larger programs. Try to develop a habit of thinking about how to name things descriptively.

#### Naming conventions

Rigorously obey Ruby's naming conventions can make other programmer read your code more easier.

> In Ruby, make sure to use snake_case when naming everything, except classes which are CamelCase or constants, which are all UPPERCASE.

#### Mutating constants

In ruby we can, but we should not.

#### Methods

A method should have single responsibility, and should not be to long.
If a method is more than 15 lines you'd better split it into 2-3 smaller methods.

#### Methods should be at the same level of abstraction

> Working this way helps compartmentalize your focus, an important skill when working on large codebases.

> If the methods in your program are correctly compartmentalized, it makes programming much easier, especially on larger programs. That is why when you read good code, the methods are all at the same layer of abstraction.

#### Method names should reflect mutation

Some methods are used to return a value, some are not. For example method like
`update_total(total)`, the implication of the method's name is it will mutate `total`.
Since `total` has been changed, we should not write something like `total = update_total(total)`

> The more you have to think about the method, the harder it is to use it. If it is performing a side effect and at the same time returning a value, this makes debugging and using the method very hard.

Good methods should be simple, easily understand, easily reusable, like LEGO blocks -- every piece of blocks looks very simple, but by wisely using these simple component tens of thousands of times, we can construct very complex and exquisite structures.

#### Displaying Output

If your method just want to output something:

```ruby
def hello
  puts "Hi there."
end
```

It's fine, but it's better to add a consistent prifix to the method name, for example
`say_`, `print_`. Strictly follow this rule can keep your mind clear about whether a method would return a value or just output some message without mutating something or returning a value.

#### Miscellaneous Tips

- One program one exit point
- Notice your indentation
- Think about how you are gonna invoke a method while you are naming it.
- Understand the nuances between different 'loop' keywords, try to keep code clean and easy to reason.

#### Truthiness

> In ruby, everything is truthy except nil and false.

#### Approach to learning

- Focus and attention is the key to learning programming
- New topics will always seem daunting
- Things do not goes like: master ruby --> master Rails --> master testing
- Inevitably we would revisiting some topics again and again
- It's normal that you can not remember most of a new topic when you first learned it.
- Keep moving forward, don't be afraid
