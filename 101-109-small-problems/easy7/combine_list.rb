def interleave(a,b)
  new_arr = []
  a.each_with_index do |e, i|
    new_arr << e
    new_arr << b[i]
  end
  new_arr
end

# use Array#zip
# http://ruby-doc.org/core-2.5.1/Array.html#method-i-zip

def interleave(a,b)
  a.zip(b).flatten
end

# Understand Array#zip
# visualizing the process like zipping up a zip
# we usually do it vertically

[x1,y1].zip [x2,y2]

[x1, y1]
[x2, y2]

vertically zipping we get [[x1,x2], [y1,y2]]

[x1, y1, z1, p1].zip([x2, y3, z2, p2],[x3])

[x1, y1, z1, p1]
[x2, y3, z2, p2]
[x3]

in order to fill the missing 'zip position' in [x3]
ruby will fill the rest position with nil object

[x1, y1, z1, p1]
[x2, y2, z2, p2]
[x3, nil, nil, nil]

so we get

[[x1,x2,x3], [y1,y2,nil], [z1,z2,nil], [p1,p2,nil]]
