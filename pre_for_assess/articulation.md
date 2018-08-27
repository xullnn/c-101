### Practice for articulating concepts precisely and depicting thought process and coding process accurately.

#### Typical practices

- Rock paper scissors(+ lizard Spock)

#### 表目的的副词以及副词性短语

- for clarity 为了清楚起见


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

-  descriptive variable and method names 描述性的变数名和方法名

-  capture the intent of the variable 明确变量的用途

- return value shouldn't be the intent of the method 方法的 return value 应该体现建立该方法的意图

- clarity over terseness 清晰优于简短

- conditional noun 条件式

#### Variable Scope

- method definition 定义方法
- method invocation with a block 带有block的方法调用

- where a variable is initialized determines its scope 变量被初始化的地方决定了他的域的范围
- Variables initialized in an outer scope can be accessed in an inner scope, but not vice versa. 在外层域中定义的本地变量能被内层域调用，但反过来则不行
- Peer blocks cannot reference variables initialized in other blocks. 同级block中初始化的变量互不相干，即使名称相同

- the block parameter `e` represents each element as the `each` method iterate through the array 当 `each` 对整个array进行迭代操作时，block parameter `e` 代表其中的单个 element

- The only variables a method definition has access to must be passed into the method definition. 方法定义唯一能存取的本地变量必须是被传入方法定义的。

- A method definition has no notion of "outer" or "inner" scope -- you must explicitly pass in any parameters to a method definition.  方法定义之内是没有所谓的 outer 或 inner 一说的 -- 你必须明确地传入参数到方法定义当中。

- local variables that are not initialized inside a method definition must be passed in as parameters. 在方法定义之外初始化的本地变量必须以参数的形式传入方法定义才能被此方法存取。

#### Coding tips 2

- loop termination condition 回圈终止条件

- sth serves as the loop termination condition 将...作为回圈终止条件
