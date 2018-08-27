
### Words & Vocabularies

take a stab at 尝试开始做
at out disposal 任我们支配
dive into 深入

### Notes

Note that the arrows show the "flow" of the logic, and that we're taking great
pains to specifically draw out the iteration logic. This helps us map out the
step-by-step logic our program would need to solve this problem. This is called
the imperative or procedural way to solve a problem. In many higher level
programming languages, basic concepts (like for example, iterating over a
collection) are encapsulated into a method. In Ruby, for example, we have a
handy each method that allows us to iterate over an Array collection. Using
each is the declarative way of solving a problem.

这种更加底层的用流程图规划出解决方案的方法叫做：
- imperative way: 命令式的方法
- percedual way: 程序式的方法


而 Ruby 那种可以直接使用 each 一步达成而不需要开发者关心更底层逻辑的方法叫：
- declarative way: 说明式的方法

---

When working with flowcharts, we are going to be imperative in our approach,
and we'll visually show how to loop manually, rather than using any declarative
constructs built in to the language.

Doing this will force you to understand the logic much better, and also force
you to "think like a computer", which will help debug logical errors in your
code. Over time, as you get better at "thinking like a computer", you can reach
for the higher level declarative syntax.


当使用流程图时，我们手动将一个loop的构造过程视觉化，这能强迫我们更好的理解其中的逻辑，也强迫我们
'像计算机一样'思考，这有助于我们发现逻辑层面的错误。

if a problem is relatively complicated, we can dismantle it into big chunks.
in this level(high level), we just need to describe the main steps into English.
Like this:

- Get the first number
  - Make sure it's valid, otherwise, ask for another
- Get the second number
  - Make sure it's valid, otherwise, ask for another
- Get the operator
  - Make sure it's valid, otherwise, ask again

- Perform operation on the two numbers
- Display result
- Ask if user wants to do another calculation

At this step, we don't care how to implement the details of 'Make sure it's valid, otherwise, ask for another'.
We just leave it there, now we only care about the whole picture

Then based on the psedo code above, we can make a flowchart. Once we are certain about
the logic of the flowchart. We could take a stab at a subprocess -- validate.
From here, again we can utilize the previouse procedure -- high level English -- Flowchart
