=begin
errors:
some common errors you might come across:
  NoMethodError
  WrongNumArguments

maybe with different errors you want to do different things.
You also want to raise your own errors sometimes—for instance you might want to match against an expected output.
Given specific inputs, we expect a certain thing to happen.
Maybe our system has certain constraints.
  Maybe you have malformed data, internet connection is poor.

The way we can think about this is big weird "if" statements

recipe:
——————————————————————————————————————————————————

begin

  #=> code to execute
  (ie UnreliableClass.crash)

rescue Exception => e

  e.message #=> message of the error
  #=> output to handle error

end

=end

begin
  # the rescues get called in order, if a rescue if found the operation stops
  undefined_method()
  [].upcase
  puts a
rescue NoMethodError => error
  puts "You're so stupid: " + error.message #=> this outputs because undefined_method() is called first.
rescue NameError => error
  puts "You dumbass, " + error.message
end







































