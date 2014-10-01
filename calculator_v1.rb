# calculator v.1.1, extracting groups within the expression given to the calculator
def process_calc(string)
  numbers = string.scan(/[\d]+/)
  operators = string.scan(/[^\s\(\)\w]/)
  groups = string.scan(/([\(]+)([\d]+)([\+\-\*\/]+)([\d]+)([\)]+)/)
  set_calc(numbers,operators,groups)
end

def set_calc(numbers,operators,groups)

  groups.map { |calc|
    calc.pop
    calc.shift
    operator = calc.select{ |i| i[/[^\s\(\)\w]/] }
    group_result = calc[0].to_i.method(operator[0]).(calc[-1].to_i)
    dupes = calc & numbers
    new_nums = numbers - dupes

    # numbers = numbers - dupes
    # calc.each { |i| numbers.delete_if { |j| j == i  } }
    # group_result = calc[0].to_i.method(operator[0]).(calc[-1].to_i)

  }

  result = operators.map { |i| numbers[0].to_i.method(i).(numbers[1].to_i) }
  print_result(result)
end

def print_result(result)
  puts "The answer is #{result[0]}"
end

puts "Calculator can add, subtract, multiply, and divide. Try it"
process_calc(gets.chomp)


=begin
a = [1, 2, 3, 4, 5]
b = [11, 22, 33, 44]
a.map! { |x| x == 5 ? b : x }.flatten!
=end

# numbers = ["4","14","2","23"]
# dupes = ["14", "2"]
# new_nums = ["4","23"]
# group_result = 7 (14/2)
# match the dupes in numbers, then replace the dupes in numbers with group_result, stripping out multiple indeces and replacing those with 1.
















# http://www.hscripts.com/tutorials/regular-expression/metacharacter-list.php
# http://stackoverflow.com/questions/17721592/two-strings-evaluated-by-regex-but-one-of-the-scan-results-are-being-put-into-a
# http://stackoverflow.com/questions/20019668/ruby-string-to-operator






=begin
  matching a group in a calculation such as:
  4*(14/2)+23 #=> should evaluate to 51
  I need to find the groupings. These could be arrays inside of arrays.
  I need to find the numbers
  I need to find the expressions inside of the expressions, contained by "(...)"

  split all of these into individual arrays, process, then reassemble the calculation
=end





