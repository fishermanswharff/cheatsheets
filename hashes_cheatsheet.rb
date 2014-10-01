require 'pry'

# hey we have a list where we have a redline, green line, orangeline
# do these have to be ordered?
# the stops themselves have to ordered. but not the lines
# flow chart: order data? yes => do this; no => do that

class MbtaRoute #=> classes in ruby are name CamelCase

  @@mbta = {
  redline: ["Alewife","Davis","Porter","Harvard","Central","Kendall/MIT","Park Street","South Station"],
  greenline: ["Haymarket","Government Center","Park Street","Boylston","Arlington","Copley"],
  orangeline: ["North Station","Haymarket","Park Street","State Street","Downtown Crossing","Chinatown","Tufts Medical Center"]
  }

  def initialize(origin_stop, origin_line, destination_stop, destination_line)
    @origin_stop = origin_stop
    @origin_line = origin_line
    @destination_stop = destination_stop
    @destination_line = destination_line
    # —————————————————————————————
    find_stops_from_origin
  end

  # here we only want to check for valid stop.
  # if the origin line is in the value, I want the key (line) that the origin stop is in.
  # I want to know how many stops away from Park STreet it is, since we know
  # that park street is our only connecting station
  # if the destination stop is in the value, I want to know the key(line) that the it's in.
  # and I want to know the distance in stops from park street.

  # return an array of values that correspond to the distance between the origin and park street
  # and the distance between destination and park
  def find_stops_from_origin
    num_stops = []
    # iterate over the hash key/values
    @@mbta.each_pair do |lines,stops|
      if stops.include?(@origin_stop) && lines.to_s == @origin_line
        num_stops << (stops.index(@origin_stop) - stops.index("Park Street")).abs
      end
      if stops.include?(@destination_stop) && lines.to_s == @destination_line
        num_stops << (stops.index(@destination_stop) - stops.index("Park Street")).abs
      end
    end
    add_array_values(num_stops)
  end

  # return the combined sum of the arrays values
  def add_array_values(array)
    total_stops = 0
    array.each do |item|
      total_stops += item
      puts item
    end
    directions(total_stops)
  end

  def directions(int)
    "You have #{int} stops to get to #{@destination_stop}"
  end
end

puts "Origin Stop please:"
origin_stop = gets.chomp

puts "Origin Line please:"
origin_line = gets.chomp

puts "Destination Stop please:"
destination_stop = gets.chomp

puts "Destination Line please:"
destination_line = gets.chomp

route = MbtaRoute.new(origin_stop, origin_line, destination_stop, destination_line)

=begin

can we use a class?
can we add in more stations/lines?

All lines intersect at Park Street, but not at any other stops.

Given this subway system, write a Ruby program that prompts the user for an "origin" stop and a "destination" stop, and tells them the number of stops they would have to make on that journey. For instance, traveling from Central to Copley would be 5 stops.

Hint: Prompt the user for four separate pieces of data: origin line, origin stop, destination line, and destination stop. You'll make things very difficult for yourself if you try to only use two prompts.

Use methods to make your code better, with each method doing a single and small task if possible. Don't try to get too clever with methods however, and sometimes you simply need two separate methods to do two different tasks!

Program has the subway system defined with appropriate data structures
Program can find the distance between two stops on the same line
Program can find the distance between two stops on different lines
Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)
Repository has several logical commits with descriptive messages
Code uses correct indentation/style and descriptive variable names


=end
