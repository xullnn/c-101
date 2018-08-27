def my_include?(arr, item)
  arr.each do |e|
    return true if e == item
  end
  false
end


p my_include?([2,3,4,5],3)

p my_include?([2,3,4,5],1)
