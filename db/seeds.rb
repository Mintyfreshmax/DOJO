# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# db/seeds.rb

require 'faker'

puts "Cleaning database...."
Activity.destroy_all
Club.destroy_all
User.destroy_all

puts " Creating users ....."
# Create 5 users
5.times do
  user = User.create(
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  p user

  club = Club.create(
    name: Faker::Company.name,
    details: Faker::Lorem.paragraph(sentence_count: 3),
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    instagram_link: Faker::Internet.url(host: 'instagram.com'),
    IBAN: Faker::Bank.iban,
    user: user
  )
  p club

# Each club has 5 activities
  5.times do
    club.activities.create!(
      title: Faker::Hobby.activity,
      description: Faker::Lorem.paragraph(sentence_count: 2),
      teacher: Faker::Name.name,
      category: %w[Boxing Football Yoga Racket Cardio Weights Outdoor Water].sample,
      address: Faker::Address.full_address,
      limit: rand(10..50),
      event_time: Faker::Time.forward(days: 30, period: :evening),
      duration: rand(1..4)
    )
  end
end

puts "Seeded database with users, clubs, and activities!"
