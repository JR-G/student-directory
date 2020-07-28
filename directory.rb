@students = []

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # get the first name
    name = STDIN.gets.strip
    # while the name is not empty, repeat this code
    while !name.empty? do
			# add the student hash to the array
			puts "Please enter their cohort:"
			cohort = STDIN.gets.strip
			# get the user to confirm the name and cohort values
			update_student_array(name, cohort)
			if @students.count == 1
				puts"Now we have #{@students.count} student"
			else
				puts "Now we have #{@students.count} students"
			end
      # get another name from the user
      name = STDIN.gets.strip
    end
	end

	def update_student_array(student, month)
		@students << {name: student, cohort: month}
	end
	
	def interactive_menu
		loop do
			print_menu
			process(STDIN.gets.chomp)
	end
end

	def print_menu
		puts "1. Input the students"
		puts "2. Show the students"
		puts "3. Save the list to students.csv"
		puts "4. Load the list from students.csv" 
		puts "9. Exit"
	end

	def show_students
		print_header
		print_students
		print_footer
	end

	def save_students
		# open the file for writing
		file = File.open("students.csv", "w")
		# iterate over the array of students
		@students.each do |student|
			student_data = [student[:name], student[:cohort]]
			csv_line = student_data.join(",")
			file.puts csv_line
		end
		file.close
	end

	def load_students(filename = "students.csv")
		file = File.open("students.csv", "r")
		file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
			update_student_array(name, cohort.to_sym)
		end
		file.close
	end

	def try_load_students
		filename = ARGV.first
		if filename.nil?
			puts "Loaded students.csv"
			load_students
		elsif File.exists?(filename)
			load_students(filename)
			puts "Loaded #{@students.count} from #{filename}"
		else
			puts "Sorry, #{filename} doesn't exist."
			exit
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
			puts "I don't know what you mean, try again"
		end
	end
  
  def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
	end
	
	def print_students
		if @students.count == 0
			puts "...There are no students"
		end
    @students.each_with_index do |student, index|
				puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)."
		end
	end

	def print_footer
		if @students.count == 1
			puts "\n","Overall, we have #{@students.count} great student".center(40), "\n"
		elsif @students.count == 0
			puts ""
		else
			puts "\n","Overall, we have #{@students.count} great students".center(40), "\n"
		end
	end

try_load_students
interactive_menu