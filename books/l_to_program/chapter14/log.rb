def log(des, &block)
  puts "Begginning the #{des} block"
  puts "Finished #{des} and returned: #{block.call}"
end


log "outer block" do
  log "second level block" do
    log "third level block" do
      "I am number 3"
    end
    "I am number 2"
  end
  "I am out most!"
end
