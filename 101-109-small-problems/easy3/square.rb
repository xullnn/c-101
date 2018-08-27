def multiply(x,y)
  x * y
end

def square(n)
  multiply(n,n)
end

# the power to the n

def power(x, n)
  if n == 1
    x
  else
    x = x * power(x, n - 1)
  end
end
