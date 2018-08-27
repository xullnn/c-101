def convert_to_roman(num)
  th_digit = "M" * (num / 1000)
  half_th_digit = "D" * (num % 1000 / 500)
  hu_digit = "C" * (num % 500 / 100)
  half_hu_digit = "L" * (num % 100 / 50)
  ten_digit = "X" * (num % 50 / 10)
  digit_num = num % 10
  if digit_num == 0
    digit = ""
  else
    if digit_num > 5
      digit = "V" + "I" * (digit_num - 5)
    elsif digit_num == 5
      digit = "V"
    else
      if digit_num == 4
        digit = "IV"
      else
        digit = "I" * digit_num
      end
    end
  end

  return roman_num = th_digit + half_th_digit + hu_digit + half_hu_digit + ten_digit + digit
end

puts "Type a number between 1 and 3000"
num = gets.chomp.to_i

puts convert_to_roman(num)
