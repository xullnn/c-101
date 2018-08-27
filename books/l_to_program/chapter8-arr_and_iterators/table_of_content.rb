array = []
puts "Please type the table name: "
title = gets.chomp
while true
  inner_array = []
  puts "Add a chapter info: "
  chapter_info = gets.chomp
  if chapter_info == ""
    puts title.center(80)
    array.each do |a|
      puts (a[0].ljust(40) + a[1].rjust(40))
    end
    break
  else
    inner_array << chapter_info
    puts "Add a chapter page info: "
    page_info = gets.chomp
    inner_array << page_info
    array << inner_array
  end
end
