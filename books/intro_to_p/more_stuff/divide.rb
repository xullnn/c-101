def divide(number, divisor)
  begin
    puts answer = number / divisor
  rescue ZeroDivisionError => e
    puts e.message
  end
end

divide(16,4)
divide(4,0)
divide(14,9)
