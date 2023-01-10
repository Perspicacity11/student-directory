# student names in array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# putting each student name
puts "The students of Villains Academy"
puts "-------------"
students.each { |student| puts student }
# print the total
puts "Overall, we have #{students.count} great students"