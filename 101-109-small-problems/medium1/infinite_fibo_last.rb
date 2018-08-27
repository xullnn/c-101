# Find the nth fibonacci number's last digit
# I used to guess there might exist a period on the last digits of a series fibonacci numbers
# But I didn't try to prove it or find it out unitl I saw other's solution
# So this is true

# This may be a hindsight, but let me pretend I am not sure about wether there is a period
# Not I wanna find it, or disprove it

# find out period or disprove there is not period
# we calculate the first 1000_000 fibonacci numbers
# if there can't find any period, we assume there's no period
# if there we find it, we return the period length



def first_nth_fibos(nth)
  fibos = []
  n = 1
  previous = 0
  current = 1
  while n < nth
    n += 1
    previous, current = current % 10, (previous + current) % 10
    fibos << current
  end
  fibos
end

def explore_period_length(fibos)
  max_period = fibos.size / 2
  (2..max_period).each do |x|
    if fibos[0,x] == fibos[x,x]
      return x
    end
  end
  nil
end

def verify_period(fibos, length)
  test_period = fibos[0,length]
  test_pool = fibos.each_slice(length).to_a[0..-2]
  100.times do
    return false if test_pool.sample != test_period
  end
  true
end

def find_period(first_nth)
  fibos = first_nth_fibos(first_nth)
  if possible_period = explore_period_length(fibos)
    verify_period(fibos, possible_period) ? possible_period : nil
  else
    nil
  end
end

def fibonacci_last(nth)
  n = nth % 60
  first_nth_fibos(n).last
end
