# Syed Atique
#Things to think about

#What to do if the class does not divide evenly into the group size?

#you need to decide what to do with the remaining students
#how do you ensure the list is randomised

students = %w(Iwona Craig GraemeK Kathryn Kieran Peter Ere Chae Zsolt Simon Syed Kieran GraemeS Keith Nevin)

print "number of students in the group \n"
number_in_group = gets.chomp.to_i
group_size = students.size/number_in_group

groups = []
#p = group_size
group_size.times do
  new_group = students.sample(number_in_group)
  groups << new_group
  new_group.each {|student| students.delete student}
end
puts "\nThis is how you randomly group your students\n "
groups.each_with_index do |group, index|
  puts "Group #{index + 1}: #{group.join(', ')}"
end

puts "Group #{group_size + 1}: #{students.join(', ')}" unless students.empty?
# for even entry of students, the final calculation most of the time gives a result with a missing student!!!!!