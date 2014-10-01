# Using strings for keys
new_england = {
  "MA" => "Mass",
  "NH" => "New Hampshire",
  "ME" => "Maine",
  "RI" => "Rhode Island",
  "CONN" => "Connecticut",
  "VT" => "Vermont"
}

# retrieves the value for the element with key "MA"
new_england["MA"] #=> Mass

# Update the value in a hash
new_england["MA"] = "Massachusetts" #=> updates the value of key "MA" => Massachusetts

# Add a key/value pair
new_england["NC"] = "North Carolina"
# new_england #=> {"MA"=>"Massachusetts", "NH"=>"New Hampshire", "ME"=>"Maine", "RI"=>"Rhode Island", "CONN"=>"Connecticut", "VT"=>"Vermont", "NC"=>"North Carolina"}

# Delete
new_england.delete("NC")
# new_england #=> {"MA"=>"Massachusetts", "NH"=>"New Hampshire", "ME"=>"Maine", "RI"=>"Rhode Island", "CONN"=>"Connecticut", "VT"=>"Vermont"}





def return_state(sym)

  # symbols for keys
  ne_states = {
    MA: "Massachuetts",
    NH: "New Hampshire",
    ME: "Maine",
    RI: "Rhode Island",
    CT: "Connecticut",
    VT: "Vermont"
  }

  if ne_states.has_key? sym
    puts ne_states[sym]
  else
    puts "That's not a NE state. You must not be from New England. What state is that?"
    ne_states[sym] = "#{gets.chomp}"
    puts ne_states
  end
end

puts "Type in state abbr.: "
return_state(gets.chomp.to_sym)



=begin


HASHES
——————————————————————————————————————————————————
Hashes consist of combinations of key/value pairs.

keys:           symbols, strings
values:         anything: arrays, hash, int/numbers, boolean, string, hashes, objects


Hashes are not ordered.
All keys within a hash must be unique. One key will always map to one value.

ARRAYS
——————
ordered, access items by index


HASH
————————
not ordered, access by key


from the Ruby-doc
SYMBOLS
————————————————————————————
Symbol objects represent names and some strings inside the Ruby interpreter.
They are generated using the :name and :"string" literals syntax, and by the
various to_sym methods. The same Symbol object will be created for a given
name or string for the duration of a program's execution, regardless of the
context or meaning of that name. Thus if Fred is a constant in one context,
a method in another, and a class in a third, the Symbol :Fred will be the
same object in all three contexts.

module One
  class Fred
  end
  $f1 = :Fred
end
module Two
  Fred = 1
  $f2 = :Fred
end
def Fred()
end
$f3 = :Fred
$f1.object_id   #=> 2514190
$f2.object_id   #=> 2514190
$f3.object_id   #=> 2514190

=end

