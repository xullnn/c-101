def profile(block_description, profile_on = true, &block)
  start_time = Time.new
  block.call
  duration = Time.new - start_time
  if profile_on
    puts "#{block_description}: #{duration} seconds"
  end
end

profile "25000 doublings", false do
  number = 1
  25000.times do
    number *= 2
  end
  puts "#{number.to_s.length} digits"
end


profile 'count to a million' do
  number = 0
  1000000.times do
    number += 1
  end
end
