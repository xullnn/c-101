(1..99).each do |n|
  puts n if n.odd?
end

n = 1
while n <= 99
  puts n if n.odd?
  n += 1
end

# standard solution

n = 1
while n <= 99
  puts n
  n += 2
end

1.upto(99) { |n| puts n if n.odd? }

puts (1..99).to_a.select { |n| if n.odd? }

puts (1..99).to_a.keep_if { |n| n.odd? }
