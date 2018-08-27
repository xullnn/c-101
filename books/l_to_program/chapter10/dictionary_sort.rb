def dic_sort(words)
  dic = []
  ('a'..'z').each do |a|
    words.each do |w|
      if w[0].downcase == a
        dic << w
      end
    end
  end
  dic
end

words = %w[zero Hello apple global ball xerophyte vally proper Notorious lead kiss Cat Alia]

p dic_sort(words)
