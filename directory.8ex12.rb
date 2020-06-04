def input_students
  puts "Please enter the names of the students"
  puts  "To finish, type 'exit'"
  puts "Enter Name:"
  # create and empty array
  students = []
  # get the first name
  name = gets.tr("\n", "")
  # while the name is not empty, repeat this code
  while !(name == 'exit') do
    # ask for cohort
    puts "Enter Cohort"
    cohort = gets.tr("\n", "")
    # sets default if the cohort is blank
    cohort = "November" if cohort == ""
    # add the student to the hash array and converts cohort from string to symbol
    students << {name: name, cohort: cohort.to_sym}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    puts "Enter Name:"
    name = gets.tr("\n", "")
  end 
  # return the array of students
  students
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------" 
end
def print(students)
  #control flow to ensure printing list
  if students.size == 0 
    puts "No Students in directory"
    return
  end
  #create empty cohort array and fill with list of cohorts
  cohort_array = []
  students.each do |student|
    cohort_array << student[:cohort]
  end
  # remove duplicates in array
  cohort_array.uniq!
  # iterate over cohort array and print student details for each cohort
  cohort_array.each do |uniq_cohort|  
    puts "## Students in #{uniq_cohort} cohort"
    students.each do |student|
       puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:cohort] == uniq_cohort
    end
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"  
end 
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)