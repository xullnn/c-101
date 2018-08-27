def index_and_value(array)
  array.each_with_index do |index, value|
    puts "#{index}: #{value}"
  end
end
