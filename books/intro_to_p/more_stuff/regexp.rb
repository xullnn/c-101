class String
  def has_char?(char)
    if self =~ Regexp.new(char)
      true
    else
      false
    end
  end
end


p "hello".has_char?("o")
p "hello".has_char?("m")
