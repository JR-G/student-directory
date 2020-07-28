def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
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
			students << {name: name, cohort: cohort, hobbies: hobbies, country: birth_country, height: height}
			if students.count == 1
				puts"Now we have #{students.count} student"
			else
				puts "Now we have #{students.count} students"
			end
      # get another name from the user
      name = gets.strip
    end
    # return the array of students
    students
  end
  
  def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
  end
  
	def print(students)
		if students.count == 0
			puts "...There are no students"
		end
    count = 0
    while count < students.count
				puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort). Their country of birth is: #{students[count][:country]} and their hobbies include: #{students[count][:hobbies]}. They are #{students[count][:height]} tall."
        count += 1
		end
	end
	
	def cohort_print(students)
		cohort_list = students.map {|student| student[:cohort]}.uniq

		cohort_list.each do |month|
			students.each_with_index do |student, index|
				puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort). Their country of birth is: #{student[:country]} and their hobbies include: #{student[:hobbies]}. They are #{student[:height]} tall." if student[:cohort] == month
			end
		end
	end

  def print_specific_letter(students, letter='a')
    students.each_with_index do |student,index|
        if student[:name][0].downcase == letter.downcase
            puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort). Their country of birth is: #{student[:country]} and their hobbies include: #{student[:hobbies]}. They are #{student[:height]} tall."
        end
    end 
  end

  def print_short_names(students)
    students.each_with_index do |student,index|
        if student[:name].length < 12
            puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort). Their country of birth is: #{student[:country]} and their hobbies include: #{student[:hobbies]}. They are #{student[:height]} tall."
        end
    end 
  end
 
	def print_footer(students)
		if students.count == 1
			puts "\n","Overall, we have #{students.count} great student".center(40), "\n"
		elsif students.count == 0
			puts ""
		else
			puts "\n","Overall, we have #{students.count} great students".center(40), "\n"
		end
	end
	
	def interactive_menu
		students = []
		loop do
			# 1. print the menu and ask the user what to do
			puts "1. Input the students"
			puts "2. Show the students"
			puts "9. Exit"
			 # 2. read the input and save it into a variable
			 selection = gets.chomp
			# 3. do what the user has asked
			case selection
			when "1"
				students = input_students
			when "2"
				print_header
				print(students)
				print_footer(students)
			when "9"
				exit # this will cause the program to terminate
			else
				puts "I don't know what you meant, try again"
		end
	end
end

interactive_menu