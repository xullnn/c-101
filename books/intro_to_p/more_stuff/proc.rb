talk = Proc.new do
  puts "I am talking."
end

talk.call

talking = Proc.new do |name|
  puts "I am talking to #{name}."
end

talking.call("Bob")
