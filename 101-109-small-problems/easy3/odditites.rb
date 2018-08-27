def oddities(array)
  array.select.with_index(1) { |e,i| i.odd? }
end
