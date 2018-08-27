def sequence(n)
  1.upto(n).map { |x| x }
end

# standard solution

def sequence(n)
  (1..n).to_a
end

# methods can both handle positive and negative numbers

def sequence(n)
  if n > 0
    1.upto(n).map { |x| x }
  elsif n < 0
    -1.downto(n).map { |x| x }
  end
end
