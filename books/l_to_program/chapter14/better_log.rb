$depth = 0

def better_log(des, &block)
  indentation = "  " * $depth
  $depth += 1
  puts "#{indentation} Begginning the #{des} block"
  puts "#{indentation} Finished #{des} and returned: #{block.call}"
  $depth -= 1
end


better_log "outer block" do
  better_log "second level block" do
    better_log "third level block" do
      "I am number 3"
    end
    "I am number 2"
  end
  "I am out most!"
end
