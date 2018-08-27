h0 = {one: "One", two: "Two"}
h1 = {one: "One", two: "Two"}
h2 = {one: "One", two: "Two"}
h_a = {two: "Hundred!!!", four: "Four", five: "Five"}

m1 = h1.merge(h_a)
if h1 == h0
  puts "merge didn't mutate caller"
else
  puts "merge mutated caller"
end

m2 = h2.merge!(h_a)
if h2 == h0
  puts "merge! didn't mutate caller"
else
  puts "merge! mutated caller"
end

if m1 == m2 && h1 == h0 && h2 == h0
  puts "merge and merge! are same."
else
  puts "merge and merge! are different."
end
