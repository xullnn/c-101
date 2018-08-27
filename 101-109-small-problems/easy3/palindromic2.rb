def palindrome?(word)
  word == word.reverse
end

def real_palindrome?(word)
  real_word = word.downcase.gsub(/[^\w]/, "")
  palindrome?(real_word)
end


# standard solution
#
# def real_palindrome?(word)
#   string = word.downcase.delete('^a-z0-9')
#   palindrome?(string)
# end
