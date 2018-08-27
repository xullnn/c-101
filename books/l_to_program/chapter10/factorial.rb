def factorial(num)
  if num < 0
    return "You cant take the factorial of a negative number!"
  end
  if num <= 1
    num
  else
    num * factorial(num - 1)
  end
end

puts factorial(3)
