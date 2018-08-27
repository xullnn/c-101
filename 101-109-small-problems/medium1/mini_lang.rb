# understand the problem
  # write a mini language as a method
  # the 'stack' is like objects we are about to handle -- in a particular order
  # the 'register' is like `self` object in ruby, it's a message receiver
  # and the 'commands' are messages we are going to send to 'register', along with objects in 'stack'

  # this mini language we are going to implement is a method
  # it take string as argument
    # the string may contain multiple words, commands or objects in stack
    # every command has a return value -- current value in register(but not to print out)
    # only `PRINT` command will print out the value currently stored in the register
    # `PRINT` command will take 0 as its default argument


# Examples and Test cases
  # minilang('PRINT')
  # # 0
  #
  # minilang('5 PUSH 3 MULT PRINT')
  # # 15
  #
  # minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
  # # 5
  # # 3
  # # 8
  #
  # minilang('5 PUSH POP PRINT')
  # # 5
  #
  # minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
  # # 5
  # # 10
  # # 4
  # # 7
  #
  # minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
  # # 6
  #
  # minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
  # # 12
  #
  # minilang('-3 PUSH 5 SUB PRINT')
  # # 8
  #
  # minilang('6 PUSH')
  # # (nothing printed; no PRINT commands)

# Data structure
  # array for stack
  # integer for register
  # string for argument

# Algorithm
  # the key is how to partition the string, keep the stack updating, hold the register

  # partition the string
  #   register value should initially set to 0
  #   String#split into words
  #     if the first word is not an integer then the chain of whole program would start from 0
  #     if the first word is an integer then update the register to it
  #

  # PUSH, POP, PRINT do not have to

def minilang(string)
  stack = []
  words = string.split
  register = 0
  until words.empty?
    word = words.shift
    if word.match /\d+/
      register = word.to_i
    else
      case word
      when "PRINT" then puts register
      when "PUSH" then stack << register
      when "POP" then register = stack.pop
      when "ADD" then register += stack.pop
      when "SUB" then register -= stack.pop
      when "MULT" then register *= stack.pop
      when "DIV" then register /= stack.pop
      when "MOD" then register %= stack.pop
      end
    end
  end
end
