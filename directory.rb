@students = []

def print_menu
  puts "1. Input students"
  puts "2. Display students"
  puts "3. Save students to CSV file"
  puts "4. Load students from CSV file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end  

def process(selection)
  case selection
    when "1"
    input_students
    when "2"
    show_students
    when "3"
    save_students
    when "4"
    load_students
    when "9"
    exit 
    else
    puts "Invalid selection"
  end
end

def input_students
  puts "Please enter the names of the students (hit return twice to finish)"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "now we have #{@students.count} students"
    name = gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
  student_data = [student[:name], [student[:cohort]]]
  csv_line = student_data.join(",")
  file.puts csv_line
  end
  file.close
end  

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first 
  return if filename.nil? 
  if File.exist?(filename) 
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "File (#{filename}) does not exist."
    exit 
  end
end

try_load_students
interactive_menu
