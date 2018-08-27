words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

h = {}

words.each do |word|
  key = word.split('').sort.join
  if h[key]
    h[key] << word
  else
    h[key] = [word]
  end
end

h.values.each do |a|
 p a
end
