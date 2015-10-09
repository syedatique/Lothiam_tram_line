# Syed Atique

stops_1 = ["Airport", "Gyle Centre", "Edinburgh Park", "Murrayfield Stadium", "Haymarket", "Princes Street", "York Place"]

stops_2 = ["Saltire Square", "West Pilton", "Telford Road", "Craigleith", "Haymarket"]

stops_3 = ["Gallery of Modern Art", "Haymarket", "EICC", "Bread Street", "Tollcross", "The Meadows"]

lines = {line_1: stops_1,  line_2: stops_2, line_3: stops_3}

print "Please provide your journey information \n"

print "\nWhat tram are you getting off:  #{lines.keys.join(', ')}?  "
off_line = gets.chomp.to_sym

print "\nWhat tram are you getting on:  #{lines.keys.join(', ')}?  "
on_line = gets.chomp.to_sym

print "\nWhich stop on the line you are getting on:   #{lines[on_line].join(', ')}?   "
get_on_station = gets.chomp

print "\nWhich stop you are getting off:   #{lines[off_line].join(', ')}?   "
get_off_station = gets.chomp

if on_line == off_line
  case on_line.to_s
  when "line_1"
    on_station_index = lines[:line_1].index(get_on_station)
    off_station_index = lines[:line_1].index(get_off_station)
    ans = off_station_index -  on_station_index
  when "line_2"
    on_station_index = lines[:line_2].index(get_on_station)
    off_station_index = lines[:line_2].index(get_off_station)
    ans = off_station_index-  on_station_index
  when "line_3"
    on_station_index = lines[:line_3].index(get_on_station)
    off_station_index = lines[:line_3].index(get_off_station)
    
    ans = off_station_index - on_station_index
  end
  
  puts "\nYour trip length is #{ans} stop."

else
  # for travelling between 2 lines
  cross_station = (lines[on_line] & lines[off_line]).first #["Haymarket"]
  puts "\n your cross station #{cross_station}"
  on_to_cross_index = lines[on_line].index(get_on_station) - lines[on_line].index(cross_station)
  off_to_cross_index = lines[off_line].index(get_off_station) - lines[off_line].index(cross_station)
  
  ans = on_to_cross_index.abs + off_to_cross_index.abs
  
  puts "\nYour trip length is #{ans} stop."

end