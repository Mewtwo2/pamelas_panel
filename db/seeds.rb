# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

40.times do
  student_age = Random.rand(18..149)
  range = Random.rand(0..3)
  edu = ['HS','College','Masters','PHD']
  student = Student.new(
    first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    age: student_age,
    education: edu[range]
  )
  match = Student.find_by(first_name: student.first_name)
  if !match
    student.save
  end
end

15.times do
  cohort = Cohort.new(
    name: Faker::Company.ein,
    start_date: Faker::Date.backward(200),
    end_date: Faker::Date.forward(200)
  )
  match = Cohort.find_by(name: cohort.name)
  if !match
    cohort.save
  end
end
