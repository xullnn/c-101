def fibonacci(nth)
  return 1 if nth <= 2
  fibonacci(nth-2) + fibonacci(nth-1)
end

# another solution that can handle bigger fibonacci number much faster
# it envolves a method named `fibonacci_tail

def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth-1, acc2, acc1 + acc2)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end
