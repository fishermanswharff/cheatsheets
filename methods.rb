=begin


Objective:
write simple methods in Ruby that
   * take arguments and
   * return value(s)

Recipe:
  def some_method(argument_a, argument_b) #=> method names are snake_case, not camelCase
       # => code to get executed goes here
       argument_a + argument_b
  end

the “some_method” method takes/requires 2 parameters/arguments argument_a & argument_b and returns the sum of argument_a + argument_b
the return value of methods is usable by other methods
return is only used inside a method. You actually don’t need to declare “return” in a method, by default in Ruby, a method will return the last value a method generates
Rule for writing method: don’t use “puts” inside a method

Separate 3 things:
   * input
   * computation
   * output

Must define a method before you call it.

=end


def some_method(a,b)
  a+b
end
puts some_method(2,2)




def cubed(number)
  number.to_i**3
end

def get_user_input
  puts "Enter a number to cube"
  gets.chomp.to_i
end

def print_output(banana)
  puts "The result is: " + banana.to_s
end

# number = get_user_input
# result = cubed(get_user_input)

print_output(cubed(get_user_input))




def rando
  rand(1..10)
end

def get_user_name
  puts "What is your name?"
  gets.chomp
end

def greet(string, number)
  puts "Hello #{string}, You're lucky number is: #{number}"
end

greet(get_user_name,rando)




def crystal_ball
  puts "Be a fortune teller:"
  gets.chomp
end

def print_fortune(string)
  "#{string} in WDI"
end

puts print_fortune(crystal_ball)





def is_prime?(number)
  count = 0
  (1..number).each { |num| number%num == 0 ? count += 1 : false }
  puts count > 2 ? false : true
end

puts "Gimme a number nom nom nom"
is_prime?(gets.chomp.to_i)



# Rock, Paper, Scissors

=begin

player plays either rock, paper, or scissors
define rock, paper, scissors as int
generate random num between 1..3
evaluate players play vs. random num
number of attempts

rock = 1
paper = 2
scissors = 3

1 > 3
2 > 1
3 > 2

rock(1) beats scissors(3)
paper(2) beats rock(1)
scissors(3) beats paper(2)

=end




def user_input
  puts "Let's play rock, paper, scissors"
  gets.chomp
end

def rando
  rand(1..3)
end

def convert_to_s(int)
  if int == 1
    return "rock"
  elsif int == 2
    return "paper"
  elsif int == 3
    return "scissors"
  end
end

def play(player1, player2)
  # puts player1, player2
  if player1 == player2
    puts "It's a tie!"
  elsif player1 == "rock" && player2 == "scissors"
    puts "You Win! You: #{player1} Opponent: #{player2}"
  elsif player1 == "paper" && player2 == "rock"
    puts "You Win! You: #{player1} Opponent: #{player2}"
  elsif player1 == "scissors" && player2 == "paper"
    puts "You Win! You: #{player1} Opponent: #{player2}"
  else
    puts "You lose! You: #{player1} Opponent: #{player2}"
  end

end

play(user_input, convert_to_s(rando))



















