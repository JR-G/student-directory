def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
      # add the student hash to the array
      puts "Please enter their hobbies?"
      hobbies = gets.chomp
      puts "Please enter their country of birth"
      birth_country = gets.chomp
      puts "Please enter their height"
      height = gets.chomp
      students << {name: name, cohort: :november, hobbies: hobbies, country: birth_country, height: height}
      puts "Now we have #{students.count} students"
      # get another name from the user
      name = gets.chomp
    end
    # return the array of students
    students
  end
  
  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end
  
  def print(students)
    count = 0
    while count < students.count
        puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort). Their country of birth is: #{students[count][:country]} and their hobbies include: #{students[count][:hobbies]}. They are #{students[count][:height]} tall."
        count += 1
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
    puts "Overall, we have #{students.count} great students"
  end
  
  students = input_students
  print_header
  print(students)
#   print_specific_letter(students)
#   print_short_names(students)
  print_footer(students)