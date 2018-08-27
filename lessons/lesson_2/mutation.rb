one = "abc"

p one.object_id

one = "abc"

p one.object_id

class C
  attr_accessor :name
end

person = C.new
person.name = "Bob"
p person.name.object_id
person.name = "Jhon"
p person.name.object_id
