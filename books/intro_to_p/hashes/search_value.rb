h = {two: "Hundred!!!", four: "Four", five: "Five"}

p h.value?("Four")

class Hash
  def has_value?(item)
    self.values.include?(item)
  end
end

p h.has_value?("Four")
p h.has_value?("four")
