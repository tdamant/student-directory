

#create @students array
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
  cohort = gets.gsub(/\n/,"").to_sym
  if !cohorts.include?(cohort)
    # December set as default cohort
    cohort = cohorts[0]
  end
  cohort
end

def input_names
  puts 'Please enter the names of the students'.center(50)
  puts 'To finish, just hit return twice'.center(50)
  name = gets.gsub(/\n/,"")
  while !name.empty? do
    cohort = input_cohorts
    @students << {name: name, cohort: cohort}
    if @students.count == 1
      puts "Now we have #{@students.count} student".center(50)
    else
      puts "Now we have #{@students.count} students".center(50)
    end
    name = gets.gsub(/\n/,"")
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students_and_cohorts
  months = []
  @students.each do |student|
    if !months.include?(student[:cohort])
      months += [student[:cohort], "--------", student[:name], "--------"]
    else
      months.insert((months.index(student[:cohort])+2),student[:name])
    end
  end
  puts months
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(50)
end

def print_menu
  puts "Choose from the following options"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def print_students
  print_header
  print_students_and_cohorts
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_names
  when "2"
    print_students
  when "9"
    exit
  else
    puts "please enter a valid input"
  end
end


def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu

# def choose_starting_letter
#   letter = ''
#   puts 'do you want to print names begging with which letter?'.center(50)
#   input = gets.gsub(/\n/,"").upcase
#   if input == "YES"
#     puts 'What letter'
#     letter = gets.gsub(/\n/,"")
#   end
# end
