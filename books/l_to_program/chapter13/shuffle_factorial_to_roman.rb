class Array

  def my_shuffle
    new_array = []
    while !self.empty?
      new_array << self.delete_at(rand(length))
    end
    new_array
  end

end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
p array.my_shuffle

class Integer
  def factorial
    return 1 if self == 0
    return "Must be positive number" if self < 0
    result = 1
    n = self
    while n != 1
      result *= (n - 1)
      n -= 1
    end
    result
  end


  def to_roman
    th_digit = "M" * (self / 1000)
    half_th_digit = "D" * (self % 1000 / 500)
    hu_digit = "C" * (self % 500 / 100)
    half_hu_digit = "L" * (self % 100 / 50)
    ten_digit = "X" * (self % 50 / 10)
    digit_num = self % 10
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
end

p 10.factorial

p 111.to_roman
