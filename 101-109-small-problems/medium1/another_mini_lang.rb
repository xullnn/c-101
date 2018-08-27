# Try writing a minilang program to evaluate and print the result of this expression:

# (3 + (4 * 5) - 7) / (5 % 3)

# The answer should be 8. This is trickier than it sounds! Note that we aren't asking you to modify the #minilang method; we want you to write a Minilang program that can be passed to #minilang and evaluated.

# understand the problem
  # the parenthesis represents the processing priority
    # the innermost parenthesis has the highest priority -- it mush be handled first
    # then the secondary innermost
    # the third ...
  # after the calculation in a parenthesis is done, it should replaced by its result
  # if all the parenthesis have been eliminated it leave us a normal arithmetic formula

  # how to find the innermost parenthesis --- find the first right-half parenthesis ')'

# Algorithm
  # the basic pattern is 'n operator n'
  # we can meet this pattern in every parenthesis and after the moment all the parenthesis been eliminated

  # find current innermost parenthesis
    # in_the_paren = string.split(")")[0].delete(")")
    # def process(pure_string)
    #   pure_string.include?(" ") ? words = pure_string.split : words = pure_string.split("")
    #   r = words[0].to_i.send(words[1], words[-1].to_i)
    # end

    # will_sub = "(#{in_the_paren})"
    # new_string = string.sub(will_sub, process(pure_string))

# def minilang(string_formula)
#   if !string_formula.include?(")")
#     process(string_formula)
#   else
#     p in_the_paren = string_formula.split(")")[0].delete("(")
#     p will_sub = "(#{in_the_paren})"
#     p result = process(in_the_paren).to_s
#     p string_formula.sub!(will_sub, result)
#     p string_formula
#     minilang(string_formula)
#   end
# end


def process(pure_string)
  eval(pure_string)
end

def inner_formula(string)
  string.split(")")[0].reverse.split("(")[0].reverse
end


def minilang(string_formula)
  if !string_formula.match(/\(/)
    p process(string_formula)
  else
    in_the_paren = inner_formula(string_formula)
    will_sub = "(#{in_the_paren})"
    result = process(in_the_paren).to_s
    new_string = string_formula.sub!(will_sub, result)
    minilang(new_string)
  end
end


minilang("2 / 2 + 1 - 6") # => -4
minilang("2 * (9 + (8 / 4) - 1)") # => 20
minilang("(3 + (4 * 5) - 7) / (5 % 3)") # => 8
minilang("(2 + ((4 * 4) - 14) / (((1+2) / 3) * 2)) * 2") # => 6
