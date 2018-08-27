def multisum(n)
  1.upto(n).select { |x| x % 3 == 0 || x % 5 == 0 }.inject(:+)
end
