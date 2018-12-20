#create students array

def input_names
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :novemeber}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header(letter)
  puts "The students of Villains Academy with names starting with a #{letter}"
  puts "-------------"
end

def choose_starting_letter
  puts 'print names begging with which letter?'
  letter = gets.chomp.upcase
end

def print(students, letter)
  counter = 0
  while counter < students.length do
    student = students[counter]
    if student[:name][0].upcase == letter
      puts "#{counter + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
    counter += 1
  end
end
#   students.each_with_index do |student, index|
#     if student[:name][0].upcase == letter
#       puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_names
letter = choose_starting_letter
print_header(letter)
print(students, letter)
print_footer(students)
