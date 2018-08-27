strings = File.read("blocks.txt")

BLOCKS = strings.split(/\s+/).map do |block|
  block.split(":").join
end

def block_word?(word)
  BLOCKS.each do |block|
    return false if word.upcase.count(block) >= 2
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# standard answer

BLOCKS.none? { |block| word.upcase.count(block) >= 2 }
