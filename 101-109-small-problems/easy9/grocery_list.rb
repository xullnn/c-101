def buy_fruit(nested_list)
  nested_list.each_with_object([]) { |pair, arr| pair[1].times { arr << pair[0] } }
end

def buy_fruit(nested_list)
  nested_list.each_with_object([]) do |pair, arr|
    pair[1].times { arr << pair[0] }
  end
end

# standard solution

# key:
# 2.5.0 :010 > ["apple"] * 3
#  => ["apple", "apple", "apple"]
# 2.5.0 :011 >

def buy_fruit(nested_list)
  nested_list.map { |pair| [pair[0]] * pair[1] }.flatten
end

def buy_fruit(nested_list)
  nested_list.map { |f, q| [f] * q }.flatten
end
