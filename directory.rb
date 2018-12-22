@students = []

def print_menu
  menu = ["Choose from the following options",
  "1. Input the students",
  "2. Show the students",
  "3. Save the list to students.csv",
  "4. Load students.csv",
  "9. Exit"]
  puts menu
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def add_names_to_students(name, cohort = :november)
  @students << {name: name, cohort: cohort}
end

def input_names
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  name = STDIN.gets.chomp
  while !name.empty? do
    add_names_to_students(name)
    name = STDIN.gets.chomp
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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
  student_data = [student[:name], student[:cohort].to_s].join(",")
    file.puts student_data
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_names_to_students(name, cohort)
  end
  file.close
end

def check_file(filename)
  if filename.nil?
    return "students.csv"
  elsif File.exists?(filename)
    filename
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end

def load_students_on_start()
  filename = ARGV.first
  load_file = check_file(filename)
  load_students(load_file)
  puts "Loaded #{@students.count} students"
end

load_students_on_start
interactive_menu
