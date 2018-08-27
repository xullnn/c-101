def count_occurrences(array)
  h = Hash.new(0)
  array.each { |e| h[e] += 1 }
  h.each { |k,v| puts "#{k} => #{v}" }
end

# standard solution
def count_occurrences(array)
  h = {}

  # ??? should array.uniq ?
  array.each do |e|
    h[e] = array.count(e)
  end

  h.each do |k,v|
    puts "#{k} => #{v}"
  end
end
