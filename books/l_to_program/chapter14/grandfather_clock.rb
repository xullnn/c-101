def reporting_clock(&block)
  current_hour = Time.new.hour
  (1..current_hour).each do |h|
    block.call(h)
  end
end

reporting_clock do |h|
  puts "Dong...#{h} o'clock!"
end
