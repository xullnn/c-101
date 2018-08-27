# Pseodo code 应该避免使用特定语言中的方法名称
  # 比如要遍历一个collection对象，那么就写 iterate through 而不要写 each
  # 因为其他语言中可能就没有这个 method
  # 而目前只是在逻辑层面思考，你写的 pseudo code 应该不需要特定技术背景也能被别人看明白

# Formal pseudo code key words:
  # keyword      ||     	meaning
  # START	start of the program
  # SET	sets a variable we can use for later
  # GET	retrieve input from user
  # PRINT	displays output to user
  # READ	retrieve value from variable
  # IF / ELSE IF / ELSE	show conditional branches in logic
  # WHILE	show looping logic
  # END	end of the program

1.a method that returns the sum of two integers

START
  the method should take 2 arguments(Numeric type)
  performing `+` method on arguments (also as return value)
EDN

2.a method that takes an array of strings, and returns a string that is all those strings concatenated together

START
  SET iterator = 1
  SET final_string = ""

  WHILE iterator <= size of array
    concatenate the "iterator"th string of the array into final_string
    SET iterator = iterator + 1

  PRINT final_string
END


3.a method that takes an array of integers, and returns a new array with every other element

START
  SET iterator = 1
  SET new_arr = []

  WHILE iterator <= size of array
    IF iterator is odd?
      push 'iterator'th number into new_arr

  PRINT new_arr
END
