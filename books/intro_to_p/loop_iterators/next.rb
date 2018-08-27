def even_number_under(num)
  loop do
    if num % 2 == 0
      puts num
      num -= 1
    else
      num -= 1
      next
    end
    break if num < 0
  end
end

even_number_under(10)
