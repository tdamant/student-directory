#create students array
def input_cohorts
  cohorts = [
    :December,
    :January,
    :Feburary,
    :March,
    :April,
    :May,
    :June,
    :July,
    :August,
    :September,
    :October,
    :November
  ]
  puts 'And now please enter the students cohort'
  cohort = gets.chomp.to_sym
  while !cohorts.include?(cohort) do
    puts 'Please re-enter a valid month'
    cohort = gets.chomp.to_sym
  end
  cohort
end

def input_names
  puts 'Please enter the names of the students'.center(50)
  puts 'To finish, just hit return twice'.center(50)
  students = []
  name = gets.chomp
  while !name.empty? do
    cohort = input_cohorts
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students".center(50)
    name = gets.chomp
  end
  students
end

def print_header(letter)
  puts "The students of Villains Academy with names starting with a #{letter}".center(50)
  puts "-------------".center(50)
end

def choose_starting_letter
  puts 'print names begging with which letter?'.center(50)
  letter = gets.chomp.upcase
end

def print(students, letter)
  counter = 0
  while counter < students.length do
    student = students[counter]
    if student[:name][0].upcase == letter
    puts "#{counter + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
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
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_names
letter = choose_starting_letter
print_header(letter)
print(students, letter)
print_footer(students)
