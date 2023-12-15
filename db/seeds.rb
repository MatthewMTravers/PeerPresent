# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Comment this out if you want to clear DB
# 7.times do
#     Student.create(
#       email: Faker::Internet.unique.email,
#       fname: Faker::Name.first_name,
#       lname: Faker::Name.last_name,
#       password: 'password',
#     )
# end

5.times do
  presentation = Presentation.new(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    date: Faker::Date.between(from: 1.year.ago, to: Date.today)
  )
  if presentation.save
    puts "Presentation created successfully: #{presentation.inspect}"
  else
    puts "Error creating presentation: #{presentation.errors.full_messages}"
  end
end

num_of_students = Student.count
max_student_id = Student.maximum(:id) || 0

if num_of_students > 0
  random_student_id = rand((max_student_id - num_of_students + 1)..max_student_id)
  student = Student.find_by(id: random_student_id)

  if student.present?
    5.times do
      Presentation.create(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph,
        date: Faker::Date.between(from: 1.year.ago, to: Date.today),
        student: student
      )
    end
  end
end

3.times do
  Faculty.create(
    email: Faker::Internet.unique.email,
    fname: Faker::Name.first_name,
    lname: Faker::Name.last_name,
    password: 'password',
  )
end

# Uncomment this if you want to clear all DB
# Student.destroy_all
# Faculty.destroy_all
# Presentation.destroy_all