require 'csv'
@students = []

def print_menu
  menu = ["Choose from the following options",
  "1. Input the students",
  "2. Show the students",
  "3. Save the list to file",
  "4. Load from file",
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
    puts "You choose to enter names:"
    input_names
  when "2"
    puts "You choose to print the list of students:"
    print_students
  when "3"
    puts "You choose to save the students:"
    save_students
  when "4"
    puts "You choose to load the students:"
    file_name = choose_file
    load_file(file_name)
  when "9"
    puts "You have choosen to exit the programe, goodbye"
    exit
  else
    puts "please enter a valid input"
  end
end

def save_students()
  puts "Please choose a file to save to, make sure it ends in .csv"
  file_name = STDIN.gets.chomp
  CSV.open(file_name, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort].to_s]
    end
  end
end

def choose_file
  puts "please enter a file name to load, if you don't enter one students.csv will be choosen as default"
  file_name = STDIN.gets.chomp
  check_file(file_name)
end

def load_file(file_name)
  @students = []
  @loaded_file = file_name
  CSV.foreach(file_name) do |row|
    name, cohort = row
    add_names_to_students(name, cohort)
  end
end

def check_file(file_name)
  if file_name.nil?
    return "students.csv"
  elsif File.exists?(file_name)
    file_name
  else
    puts "Sorry #{file_name} doesn't exist"
    exit
  end
end

def load_students_on_start
  file_name = ARGV.first
  file_to_load = check_file(file_name)
  load_file(file_to_load)
  puts "Loaded #{@students.count} students from #{@loaded_file}"
end

load_students_on_start
interactive_menu
