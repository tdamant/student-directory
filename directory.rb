@students = []

def print_menu
  puts "Choose from the following options"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load students.csv"
  puts "9. Exit"
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

def try_load_students()
  filename = ARGV.first
  if filename.nil?
    load_students()
    puts "Loaded #{@students.count} students"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu
