@students = []
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # get the first name
    name = gets.strip
    # while the name is not empty, repeat this code
    while !name.empty? do
			# add the student hash to the array
			puts "Please enter their cohort:"
			cohort = gets.strip
			# get the user to confirm the name and cohort values
			puts "is name: '#{name}' & cohort: '#{cohort}' correct? (y/n)"
			confirm = gets.strip
			if confirm == "n"
				puts "Please re-enter their name:"
				name = gets.strip
				puts "Please re-enter their cohort:"
				cohort = gets.strip
			end
      puts "Please enter their hobbies:"
      hobbies = gets.strip
      puts "Please enter their country of birth:"
      birth_country = gets.strip
      puts "Please enter their height:"
      height = gets.strip
			@students << {name: name, cohort: cohort, hobbies: hobbies, country: birth_country, height: height}
			if @students.count == 1
				puts"Now we have #{@students.count} student"
			else
				puts "Now we have #{@students.count} students"
			end
      # get another name from the user
      name = gets.strip
    end
	end
	
	def interactive_menu
		loop do
			print_menu
			process(gets.chomp)
	end
end

	def print_menu
		puts "1. Input the students"
		puts "2. Show the students"
		puts "9. Exit"
	end

	def show_students
		print_header
		print_students
		print_footer
	end

	def process(selection)
		case selection
		when "1"
			input_students
		when "2"
			show_students
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
				puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort). Their country of birth is: #{student[:country]} and their hobbies include: #{student[:hobbies]}. They are #{student[:height]} tall."
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

interactive_menu