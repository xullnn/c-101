### What is debugging?

- Bugs are human erros in code.
- Debugging is the process of identifying and fixing these errors.


### How do we debug code?

- Identify the problem
- Understand the problem
- Implement a solution

### Types of error

- Syntax errors
- Logical errors

### What is pry?

- pry is a Ruby gem
- pry is a REPL: Read-Evaluate-Print Loop
- an interactive environment that:
  - takes user input
  - evaluate the input
  - returns the results to the user
  - loop back to the start

### Using pry

- pry is an interactive environment much likes terminal or irb
  - `ls` list all available methods of current `self` object
  - `cd` can 'enter an object' or say change the background of `self`
  - within an object it can use various methods that can performed on this object
  - within an object use `show-doc method_name` can display the doc for this specifed `method_name`
  - use `cd ..` can 'exit an object' or use `cd /` can move directly to `main`
  - `exit` can exit.

```ruby
>pry

[1] pry(main)> 1 + 1
=> 2
[2] pry(main)> puts "pry"
pry
=> nil
[3] pry(main)> exit
```

- There's also a `cd` method in pry, but it isn't used for 'change directory', it can 'enter an object's body'

```ruby
[1] pry(main)> ls
self.methods: inspect  to_s
locals: _  __  _dir_  _ex_  _file_  _in_  _out_  _pry_
[2] pry(main)>

[3] pry(main)> arr = [1,2,3]
=> [1, 2, 3]

[4] pry(main)> cd arr

[5] pry(#<Array>):1> ls
Enumerable#methods:
  all?            each_entry        find_all  lazy       none?         slice_when
  chunk           each_slice        flat_map  max_by     one?          sort_by
  chunk_while     each_with_index   grep      member?    partition     to_set
  collect_concat  each_with_object  grep_v    min_by     reduce
  detect          entries           group_by  minmax     slice_after
  each_cons       find              inject    minmax_by  slice_before
Array#methods:
  &              collect!     fetch       map!                  replace       sort
  *              combination  fill        max                   reverse       sort!
  +              compact      find_index  min                   reverse!      sort_by!
  -              compact!     first       pack                  reverse_each  sum
  <<             concat       flatten     permutation           rindex        take
  <=>            count        flatten!    place                 rotate        take_while
  ==             cycle        frozen?     pop                   rotate!       to_a
  []             delete       hash        prepend               sample        to_ary
  []=            delete_at    include?    pretty_print          select        to_h
  any?           delete_if    index       pretty_print_cycle    select!       to_s
  append         dig          insert      product               shelljoin     transpose
  assoc          drop         inspect     push                  shift         uniq
  at             drop_while   join        rassoc                shuffle       uniq!
  bsearch        each         keep_if     reject                shuffle!      unshift
  bsearch_index  each_index   last        reject!               size          values_at
  clear          empty?       length      repeated_combination  slice         zip
  collect        eql?         map         repeated_permutation  slice!        |
self.methods: __pry__
locals: _  __  _dir_  _ex_  _file_  _in_  _out_  _pry_
[6] pry(#<Array>):1>

[7] pry(#<Array>):1> first
=> 1

[8] pry(#<Array>):1> show-doc reduce
From: enum.c (C Method):
Owner: Enumerable
Visibility: public
Signature: reduce(*arg1)
Number of lines: 33

Combines all elements of enum by applying a binary
operation, specified by a block or a symbol that names a
method or operator.

The inject and reduce methods are aliases. There
is no performance benefit to either.

If you specify a block, then for each element in enum
the block is passed an accumulator value (memo) and the element.
If you specify a symbol instead, then each element in the collection
will be passed to the named method of memo.
In either case, the result becomes the new value for memo.
At the end of the iteration, the final value of memo is the
return value for the method.

If you do not explicitly specify an initial value for memo,
then the first element of collection is used as the initial value
of memo.


   # Sum some numbers
   (5..10).reduce(:+)                             #=> 45
   # Same using a block and inject
   (5..10).inject { |sum, n| sum + n }            #=> 45
   # Multiply some numbers
   (5..10).reduce(1, :*)                          #=> 151200
   # Same using a block
   (5..10).inject(1) { |product, n| product * n } #=> 151200
   # find the longest word
   longest = %w{ cat sheep bear }.inject do |memo, word|
      memo.length > word.length ? memo : word
   end
   longest                                        #=> "sheep"

[9] pry(#<Array>):1> cd ..

[10] pry(main)>
```

### Invoking pry at runtime

- Using `binding.pry`
  - A `binding` is something that contains references to any variables that were in scope at the point where it was created.
  - `pry` interrupts program execution and *pries open* the binding so that we can have a look around.
- `whereami` to show your current position
  - `whereami n` can show n lines of code before and beneath current postion
- `pry-byebug` extends pry with some additional commands
  - next
  - step
  - continue

  - similar gems exist such as pry-nav and pry-debugger
  - The concept of stepping through and into code is not limited to `pry` or Ruby
- There are equivalents in other languages, such as Chrome Dev Tools

### Take aways

- Debugging is an important skill to learn and practice
- Tools such as pry and pry-byebug make debugging easier
- Using these tools also helps to learn more about code
- These debugging concepts are not limited to Ruby
