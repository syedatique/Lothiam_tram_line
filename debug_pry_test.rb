require 'pry-byebug'
my_number = 4
value = gets.to_i
until value == my_number

  binding.pry

  print "nope"
  value = gets.to_i
end





stops_1 = ["Airport", "Gyle Centre", "Edinburgh Park", "Murrayfield Stadium", "Haymarket", "Princes Street", "York Place"]

stops_2 = ["Saltire Square", "West Pilton", "Telford Road", "Craigleith", "Haymarket"]

stops_3 = ["Gallery of Modern Art", "Haymarket", "EICC", "Bread Street", "Tollcross", "The Meadows"]


lines = {line_1: stops_1,  line_2: stops_2, line_3: stops_3}


print "Please provide your journey information \n"

print "What tram are you getting off: #{lines.keys.join(', ')}?"
off_line = gets.chomp.to_sym

print "What tram are you getting on: #{lines.keys}?"
on_line = gets.chomp.to_sym
puts "this is online #{on_line}"


print "which stop on the tram you are getting on: #{lines[on_line]}?"
get_on_station = gets.chomp

print "which stop you are getting off: #{lines[off_line]}?"
get_off_station = gets.chomp #get_string


def same_line

case on_line
   when 'line_1'
    on_index = lines[:line_1].index(get_on_station)
    off_index = lines[:line_1].index(get_off_station)
    puts "this is on index #{on_index}"
    puts "this is off index #{off_index}"

    ans = off_index-  on_index


   when 'line_2'
    on_index = lines[:line_2].index(get_on_station)
    off_index = lines[:line_2].index(get_off_station)
    ans = off_index-  on_index


   when 'line_3'
    on_index = lines[:line_3].index(get_on_station)
    off_index = lines[:line_3].index(get_off_station)
    ans = off_index - on_index
end
puts "Your trip length is #{ans} stop"
end


def different_lines
  cross_station = (lines[on_line] & lines[off_line]).first #["Haymarket"]
  puts "\n your cross station #{cross_section} \n"
  on_to_cross_index = lines[on_line].index(get_on_station) - lines[on_line].index(cross_station)
  off_to_cross_index = lines[off_line].index(get_off_station) - lines[off_line].index(cross_station)

  ans = on_to_cross_index.abs + off_to_cross_index.abs
end

if on_line == off_line
  same_line

else

  cross_station = (lines[on_line] & lines[off_line]).first #["Haymarket"]
  puts "\n your cross station #{cross_station} \n"
  on_to_cross_index = lines[on_line].index(get_on_station) - lines[on_line].index(cross_station)
  off_to_cross_index = lines[off_line].index(get_off_station) - lines[off_line].index(cross_station)

  ans = on_to_cross_index.abs + off_to_cross_index.abs

  puts ans

end