# 14
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

infos = [:email, :address, :phone]

contacts.each_with_index do |(k,v),i|
  infos.each_with_index do |info, index|
    contacts[k][info] = contact_data[i][index]
  end
end

p contacts

# 15
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |e| e.start_with? 's', 'w' }

# 16

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a.map! { |e| e.split(" ") }.flatten!
