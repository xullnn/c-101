NUMBERS = 'zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen'.split(', ')

def alphabetic_number_sort(array_of_integers)
  words = array_of_integers.map do |number|
    NUMBERS[number]
  end.sort
  words.map { |word| NUMBERS.index(word) }
end
