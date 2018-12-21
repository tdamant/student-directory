

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
  if !cohorts.include?(cohort)
    # December set as default cohort
    cohort = cohorts[0]
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

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  months = []
  students.each do |student|
    if !months.include?(student[:cohort])
      months += [student[:cohort], "--------", student[:name], "--------"]
    else
      months.insert((months.index(student[:cohort])+2),student[:name])
    end
  end
  puts months
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_names
print_header
print(students)
print_footer(students)

# def choose_starting_letter
#   letter = ''
#   puts 'do you want to print names begging with which letter?'.center(50)
#   input = gets.chomp.upcase
#   if input == "YES"
#     puts 'What letter'
#     letter = gets.chomp
#   end
# end
