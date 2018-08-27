def convert_num(number)
  return "Number should greater than 0" if number < 0
  return "Number should less than 10 million" if number > 100000000
  english_num = ''
  if number < 1000
    english_num += num_under_thousand(number)
  elsif number >= 1000 && number < 1000000
    english_num += num_under_thousand(number/1000) + " thousand"
    if number % 1000 != 0
      english_num += num_under_thousand(number % 1000)
    end
  elsif number >= 1000000
    english_num += num_under_thousand(number/1000000) + " million "
    english_num += convert_num(number % 1000000)
  end
  english_num
end


def num_under_thousand(number)
  less_twenty = %w[palce_holder one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
  tens = %w[place_holder place_holder twenty thirty fourty fifty sixty seventy eighty ninety]
  english_num = ''
  if number < 20
    english_num += less_twenty[number]
  else
    if number < 100
      english_num += tens[number/10]
      if number % 10 != 0
        english_num += " " + less_twenty[number % 10]
      end
    elsif number >= 100 && number < 1000
      english_num += " " + less_twenty[number/100] + " hundred "
      if number % 100 != 0
        english_num += "and " + num_under_thousand(number % 100)
      end
    end
  end
  english_num
end

p convert_num(11111111)
# => "eleven million  one hundred and eleven thousand one hundred and eleven"
p convert_num(98765432)
# => "ninety eight million  seven hundred and sixty five thousand four hundred and thirty two"
