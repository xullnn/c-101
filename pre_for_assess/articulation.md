### Practice for articulating concepts precisely and depicting thought process and coding process accurately.

#### Typical practices

- L2
  - Rock paper scissors(+ lizard Spock)

#### 表目的的副词以及副词性短语

- for clarity 为了清楚起见 或者 to clarify
- more idiomatically 更加符合语言习惯的

#### Ruby style

- ` # ` 读 number sign、hash、hashtag

- initiate a varaible, constant 新建、初始化、或定义一个变数或常量

- code expression 用来泛指代一段代码

- declare a class name 用来描述新建一个类， 比如

```ruby
class Person

end
```

Use `CamelCase` formatting and no spaces between, either captialize every word.

#### A Note on Style

- invoke a method 援引(引起，启动)一个方法
■(Computing)cause (a procedure) to be carried out
(计算机)激活（程序)，启动（程序

- method invocation 上述过程的名词化表达

- call a method 调用一个方法
■(Computing)cause the execution of (a subroutine)
(计算机)调用，引入（子程序）

- method calling 上述过程的名词化表达

- use a method 使用一个方法

- differentiate method invocations and local variables 区分方法引用和本地变量

#### Walk-through: Calculator

- ask for two numbers 需求两个数字
- ask for the type of operation to perform 询问需要执行的操作类型

- 20-line program 一个20行的程序

- equality comparison 等式比较
- assignment 赋值操作
- assignment operator 赋值运算符 (= in Ruby)
- assignment statement 赋值语句；指派陈述

- compare against(with) 和…相比较. notice the object that the string is comparing against(with) 注意正在与此字符串作比较的对象

- Local variables initialized within an `if` can be accessed outside of the `if`.

- `if` expression `if` 语句

#### Pseudo-Code

*Pseudo code is a tool for helping you to load the problem into your brain, it's only possible to write the whole logical process facing a simple problem. For more complex problem, we should use piecemeal pseudo code to approach the solution -- even in a alternate way: piece of pseudo code -- pice of real code -- verify logic -- next piece of pseudo code -- next piece of real code -- verify ...*

>  That is, you won't be able to detail out the entire problem first in pseudo-code, then translate all of it into Ruby. If you did, you'd likely discover that a lot of your logic or assumptions in the pseudo-code is incorrect, and you'll need to make some changes that will ripple across the entire program, forcing you to start over time and again.

- Ruby interpreter Ruby解释器

- Given a collection of integers 给出一组整数

- Iterate through the collection one by one 逐个对集合中所有对象进行迭代操作
- for each iteration 对于每次迭代
- greater or equal to 大于或等于
- reassign the saved value as the current value 用当前值[重新赋值给, 覆盖]存留值

- load the problem in your brain 形成对问题的印象

- verify its logic 验证其逻辑

- pseudo code
- programming code

- conditional branches 条件分支

- guard clause 防御性分句，从句
Perhaps we can use a guard clause that returns `nil`, like this: `return if numbers.nil?`

- on every iteration 在每一步迭代时

#### Flowchart

- dissect a problem(or the logic) 拆解一个问题（或逻辑）

> This is going to take some practice, and you do not have to use either pseudo-code or flowcharts at all. If you've been programming for a while, it's likely you don't need these aids. If you're new to programming and have trouble "thinking like a computer", try using these tools before you jump straight into program code.

#### Rubocop

- static code analyzer 静态代码分析器

- modular framework 模块化框架
- pluggable architecture 可嵌入式结构
Rubocop itself is a modular framework using a pluggable architecture to insert enforcement rules.

- be indented with 2 spaces 以两个空格位置缩排

- Create a file, name it hello.rb 新建一个文件，命名为...

#### Walk-through: Refactoring Calculator

- omit the parentheses 忽略掉括号

#### Debugging

- (some object) be assigned to (variable) X  某个对象被赋值（指派）给变数X
- (some object) gets assigned to (variable) X  某个对象被赋值（指派）给变数X
- we assigns (some object) to (variable) X 我们将某个对象赋值（指派）给变数X
- multiple assignment 多重赋值

> When an array is assigned to two variables on the same line, each element of that array gets assigned to one of the variables. In the example above, the first array element gets assigned to `make` and the second array element gets assigned to `model`. This type of assignment, where we assign more than one value on the same line, is called "multiple assignment".

- Let me trace the code backwards 让我回溯一下代码

- the string represented by the local variable `new_car` 那个被本地变数指代的string对象
> The string represented by the local variable new_car is passed into two helper method: make and model

- the bug in this code originates from the `model` method 这段代码中的bug源于这个名为`model`的方法

- error condition 出错的状况

#### Coding Tips

- descriptive variable and method names 描述性的变数名和方法名

- capture the intent of the variable 明确变量的用途

- return value should be the intent of the method 方法的 return value 应该体现建立该方法的意图

- clarity over terseness 清晰优于简短

- conditional. noun 条件式

#### Variable Scope

- method definition 定义方法
- method invocation with a block 带有block的方法调用

- where a variable is initialized determines its scope 变量被初始化的地方决定了他的域的范围
- Variables initialized in an outer scope can be accessed in an inner scope, but not vice versa. 在外层域中定义的本地变量能被内层域调用，但反过来则不行
- Peer blocks cannot reference variables initialized in other blocks. 同级block中初始化的变量互不相干，即使名称相同

- the block parameter `e` represents each element as the `each` method iterate through the array 当 `each` 对整个array进行迭代操作时，block parameter `e` 代表其中的单个 element

- The only variables a method definition has access to must be passed into the method definition. 方法定义唯一能存取的本地变量必须是被传入方法定义中的。

- A method definition has no notion of "outer" or "inner" scope -- you must explicitly pass in any parameters to a method definition.  方法定义之内是没有所谓的 outer 或 inner 一说的 -- 你必须明确地传入参数到方法定义当中。

- local variables that are not initialized inside a method definition must be passed in as parameters. 在方法定义之外初始化的本地变量必须以参数的形式传入方法定义才能被此方法存取。

#### Coding tips 2

- loop termination condition 回圈终止条件

- sth serves as the loop termination condition 将...作为回圈终止条件

#### Practice Problems

- modify an object 改变一个对象

- call `method` on (some object) 对某个对象使用某个方法 比如 `"hello".inspect`

- referenced array (通常指某个变数)指向的array

- Notice that once we leave the block, those variables that were defined inside the block lose their meaning. 当我们离开一个block时，之前在其内部定义的变量就失去了意义

- live within the scope of the method definition 只在方法定义中有效

- the block doesn't get executed 那个block代码段没有被执行

- `some_variable` is a reference to the original object 变量`some_variable`是对原来那个对象的指代

- (some method) modifies the object that called it 某个方法修改了那个调用他的对象

---

### L4

#### Collections Basics

- integer-based index 基于整数的索引
- the index starts counting at zero and increments by one for the remaining index values 索引从0开始计数，之后的索引值以每次+1递增
- reference a specific character using index 使用索引号引用具体字符

You can also reference multiple characters within a string by using an index starting point and the number of characters to return. 你也可以从一个字符串内部取得多个字符串，通过传入一个起始索引值以及需要返回的字符数量
- index starting point 索引起始值
- the number of characters to return 需要返回的字符数量

- method chaining 方法串接

- array is also ordered, zero-indexed collection array是有序的，以0为起始索引值的集合
- A specific element can be referenced using its index. 使用索引可以引用到具体的元素

- `some method` is called on the return value 对某个return value使用某个方法

The first one is over-written by the third as they have identical keys.
- be over-written by 被...覆盖

- reference the item an index 0 引用索引值为0的那个物件

- use symbol as keys 使用symbol作为key

- out-of-bounds index 超出边界的索引值

- the referenced index lies outside of the array bounds 被引用的索引值在array的边界以外

- negative index 负值索引

- reference an item by its key 通过key来取得物件

- strings and arrays share similarities strings和arrays共享一些相似性

- String Element Assignment 字符串元素赋值

- surround the whole string in double quotations 用双引号环绕整个字符串

- Array Element Assignment array元素赋值

- Hash Element Assignment hash元素赋值

#### Looping

- Any code within the block will be executed each time the loop performs an iteration.
所有block中的代码都会在loop进行每一次迭代时被执行

- an infinite number of times 无限次数

- a random number between 1 and 10 is assigned to `number`

- the `if` statement checks if `number` is equal to `5`
  - if so ...
  - if not then ...

- we have a `if` condition for `break` 我们有`if`条件式包裹`break`

- a variable that tracks the number of iterations performed 一个用来追踪已执行的迭代次数的变数

- assign a variable `counter` that represents the current iteration number 新建一个变量`counter`来表示当前迭代次数

- increment `counter` by `1` during each iteration 在每次迭代中让`counter`递增1

- `counter` is initialized outside of the loop `counter`是在loop之外(前)初始化的
- initialized a variable `counter` before the loop

- the `break` condition would never be met `break` 就永远不会满足`break`条件
- meet the `break` condition 遇到`break`条件

- if modifier. `if` 条件修饰  至在行内使用`if`的句法比如 `break if n > 5`

- move `break` to the first line within the loop 将`break`移到loop内部的第一行

- `next` tells the loop to skip the rest of the current iteration and begin the next one
`next`告诉loop跳过当前迭代中的剩余部分，直接开始下一次迭代

- when `next` is executed, any code after it will be ignored 当`break`被执行时，它之后的所有代码都会被跳过

- will result in infinite loop 将会导致无限回圈

- the index value associated with the specific character 与具体字符相关联的索引值

- be printed one at a time 每次被印出一个

- a space is also a character 空格也是一个字符

- sth equals sth 作联系动词
- sth and sth are equal 作形容词
- one things is equal to another 形容词

- fetch the value we want via specific key  通过具体的key拿到我们想要的值

- interpolate sth into the string 将...插入string

#### Selection and Transformation

- Selection is picking certain elements out of the collection depending on some criteria.
selection会基于某些标准把某些特定元素从collection中选出来

- Transformation refers to manipulating every element in the collection.
Transformation(变换)指对collection中的每个元素进行操纵

Selection and transformation both utilize the basics of looping: a loop, a counter, a way to retrieve the current value, and a way to exit the loop. Keep those four things in mind.
拣选和变换都基于loop操作: 一个循环器, 一个计数器，一种提取当前值的方式，以及退出机制。

- the selection criteria is what determines which values are selected and which ones are ignored 决定那些值被选取或者忽略的是选择标准

- append an `'s'` to each string in the array

- apply the transformation to every element in the array 对每一个array中的元素进行了变换操作

- we perform the transformation on a new array and leave the original array unchanged
我们是在一个新array上进行变换操作而保持了原array不变

- it returns a new collection containing the selected values 它返回一个包含有选中值的新集合

- what if we wanted to transform the numbers based on their position in the array rather than their value?
如果我们想要基于数字在array中的位置来进行变换操作而不是他们本身的值应该怎么做？

- double the numbers that have odd index 将index是奇数的数字翻倍

- interchangable syntax 同义句法

#### Methods

- `some method` is functionally equivalent to using `another method` 某方法和另一方法在功能上等价

- accomplish a task 实现（完成）一个任务

- the method takes a block, which is the `do...end` part 这个方法接受一个block, 也就是`do...end`那部分

- the code within the block is executed for each iteration block中的代码会在每一次迭代时被执行

- `each` sends the value of the current element to the block in the form of an argument
`each` 以单个参数形式将当前元素传入block中

- per iteration 每一步迭代

- arguments to the block block相关的参数

- iterate over a collection in a manual way by using `loop` 通过使用`loop`来手工迭代处理一个集合

- the return value of the entire expression is the return value of the `each` invocation
整个代码表达的return value就是调用`each`后的return value

- the return value of method is the return value of the last expression within the method
一个方法的return value就是其内部最后一个代码表达的return value

- manage a loop manually with a counter and break condition 通过计数器和断点条件来实现一个loop

- `select` evaluates the return value of the block `select`评估block的return value

- the block returns a value on each iteration block在每每一步迭代后返回一个值

- gets evaluated by `select` 被`select`评估

- `select` only cares about the truthiness of the return value `select` 只关心return value的'真假性质'

- the element during that iteration will be seleted 当前迭代中的元素会被选中

- a truthy value 一个会被判别为真的值

#### More Methods

- `all?` only returns `true` if the block's return value in every iteration is truthy `all?`方法只会在每一步迭代的block返回值都是true的时候返回 true

- use parentheses to capture the key and value in the first block argument  在block的第一个参数位置，使用括号来捕捉key和value

- `first` will return the specified number of elements `first`会返回自定数量的元素

- hashes are typically thought of as unordered and values are retrieved by keys hash通常被视作无序集合且是通过key来取得value

- since Ruby 1.9, order is preserved according to the order of insertion 从Ruby1.9开始，顺序会基于注入先后次序保留

- `partition` divides up elements in the current collection into two collections, depending on the block's return value
`partition` 将当前集合拆分成两个集合，基于block的return value

- parallel assign 平行赋值 `a,b = 1,2`

#### Practice Problems: Methods and More Methods

- `select` performs selection based on the truthiness of the block's return value

- `count` only counts an element if the block's return value evaluates to `true`

- `reject` returns a new array containing items where the block's return value is `falsy`

- `shift` destructively removes the first key-value pair in the hash and returns it as a two-item array

- `pop` destructively removes the last element from the calling array and returns it

- `Array#take` takes the first n elements from the array

- when none of the conditions in an `if` statement evaluates as `true`, the `if` statement itself returns `nil`

### L 5

#### Sorting

- sorting is setting the order of the items in a collection according to a certain criteria

- the numbers are ordered numerically

- comparison is at the heart of how sorting works

- `cape` is longer than `cap` and so is considered greater by `String#<=>`

- symbols are compared after `to_s` is called on them

#### Nested Data Structures

- retrieve its second element

- (some operation) is destructive action that permanently changed the second element in the array

- array element update (like `array[2] = "x"`)
- element reference (like `array[1]`)

- chain element reference with appending an element 在array引用后串接注入元素的操作

- three-layer nested data stucture

- two step process

#### Working with Blocks

- the `puts` method then outputs a string representation of the integer

- triple-level nested array

- uneven nested levels (like: `[[[1, 2], [3, 4]], [5, 6]]`)

#### Practice Problems: Sorting, Nested Collections and Working with Blocks

- return a subset of the objects in the outer array (`select`)

### L 6

#### Tic Tac Toe Problem Decomposition

- decompose the problem 分解问题

- map the logic out / map out the logic

- isolate code into reasonable chunks and extract to methods

- write methods that have on single responsibility
