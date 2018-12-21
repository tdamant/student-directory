


@students = []

def input_names
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :novemeber}
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "Choose from the following options"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load students.csv"
  puts "9. Exit"
end

def print_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_names
  when "2"
    print_students
  when "3"
    save_students
  when "4"
    load_students
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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort].to_s].join(",")
    file.puts student_data
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end



interactive_menu
