require 'csv'

@students = []
@default_file = "students.csv"

def input_students
    puts "Please enter the name of the student:"
    puts "(To exit, just hit return twice)"
    # get the first name
    name = STDIN.gets.strip
    # while the name is not empty, repeat this code
    while !name.empty? do
			# add the student hash to the array
			puts "Please enter their cohort:"
			cohort = STDIN.gets.strip
			# get the user to confirm the name and cohort values
			update_student_array(name, cohort)
			puts @students.count == 1 ? "Now we have #{@students.count} student" : "Now we have #{@students.count} students"
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
		puts "\n", "~Student Directory Menu~".center(35), "\n"
		puts "1. Input the students"
		puts "2. Show the students"
		puts "3. Save the student list to a file"
		puts "4. Load the student list from a file" 
		puts "9. Exit"
	end

	def show_students
		print_header
		print_students
		print_footer
	end

	def save_students(filename_to_save = @default_file)
		# open the file for writing
		CSV.open(filename_to_save, "wb") do |file|
		# iterate over the array of students
		@students.each do |student|
			file << [student[:name], student[:cohort]]
		end
	end
		puts "File saved ✅"
	end

	def load_students(filename_to_load = @default_file)
		CSV.foreach(filename_to_load) do |row|
			name, cohort = row
			update_student_array(name, cohort.to_sym)
		end
		puts "\n", "File loaded ✅", "\n"		
	end

	def try_load_students
		filename = ARGV.first
		if filename.nil?
			puts "\n", "'students.csv' is loading as the default file...", "\n"
			load_students
		elsif File.exists?(filename)
			load_students(filename)
			puts "Loaded #{@students.count} from #{filename} ✅"
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
			puts "\n", "⏳ Loading Student Directory...", "\n"
			show_students
		when "3"
			puts "Please enter the filename to save or hit return to load the default file 'students.csv':"
			file_to_save = gets.strip
			if file_to_save.empty?
				puts "⏳ Saving students to #{@default_file}..."
				save_students
			else
				puts "⏳ Saving students to #{file_to_save}..."
				save_students(file_to_save)
			end
		when "4"
			puts "Please enter the filename to load or hit return to load the default file 'students.csv':"
			file_to_load = gets.strip
			p file_to_load
			if file_to_load.empty?
				puts "⏳ Loading students from #{@default_file}..."
				load_students
			else
			puts "⏳ Loading students from #{file_to_load}..."
			load_students(file_to_load)
			end
		when "9"
			puts "Exiting program..."
			puts "\n", "Goodbye! 👋"
			exit
		else
			puts "I don't know what you mean, try again"
		end
	end
  
	def print_header
		puts "--------------------------------------------", "\n"
    puts " 🧛‍ The Students of Villains Academy 🧛‍ ".center(43)
		puts "-------------".center(43)
		puts "-------".center(43)
		puts "\n","Current Students:", "\n"
	end
	
	def print_students
		if @students.count == 0
			puts "...There are no students at the Academy"
		end
    @students.each_with_index do |student, index|
				puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)."
		end
	end

	def print_footer
		if @students.count == 1
			puts "\n","\n","We have #{@students.count} great student!", "\n"
			puts "--------------------------------------------"
		elsif @students.count == 0
			puts ""
		else
			puts "\n","\n","Overall, we have #{@students.count} great students!", "\n"
			puts "--------------------------------------------"
		end
	end

try_load_students
interactive_menu