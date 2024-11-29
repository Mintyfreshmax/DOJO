require 'faker'

Activity.destroy_all
Club.destroy_all
User.destroy_all

puts "Old data cleared."

# Addresses in Brussels, Belgium
brussels_addresses = [
  "Grand Place, 1000 Brussels, Belgium",
  "Avenue Louise 105, 1050 Brussels, Belgium",
  "Rue Neuve 123, 1000 Brussels, Belgium",
  "Parc du Cinquantenaire, 1000 Brussels, Belgium",
  "Place Sainte-Catherine, 1000 Brussels, Belgium",
  "Boulevard Anspach 20, 1000 Brussels, Belgium",
  "Chaussée de Charleroi 75, 1060 Brussels, Belgium",
  "Rue Antoine Dansaert 50, 1000 Brussels, Belgium",
  "Bois de la Cambre, 1180 Brussels, Belgium",
  "Atomium, Square de l'Atomium, 1020 Brussels, Belgium"
]

# Relevant club and activity data
club_data = [
  { name: "Brussels Boxing Club", category: "Boxing", activities: ["Evening Boxing Class"] },
  { name: "Fit & Fun Yoga Studio", category: "Yoga", activities: ["Vinyasa Yoga Flow"] },
  { name: "Brussels Football Academy", category: "Football", activities: ["Beginner Football Training"] },
  { name: "Tennis Club Louise", category: "Racket", activities: ["Tennis for All Levels"] },
  { name: "Cardio Boost Gym", category: "Cardio", activities: ["High-Intensity Cardio Blast"] },
  { name: "Weights & Strength Center", category: "Weights", activities: ["Weightlifting Basics"] },
  { name: "Brussels Outdoor Adventures", category: "Outdoor", activities: ["Weekend Hiking Group"] },
  { name: "Aqua Sports Brussels", category: "Water", activities: ["Swimming for Beginners"] }
]

# Create users

5.times do
  user = User.create!(
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  p user

  # Assign a club to each user
  club_data.sample(1).each do |club_info|
    club_address = brussels_addresses.sample
    club = Club.create!(
      name: club_info[:name],
      details: Faker::Lorem.paragraph(sentence_count: 3),
      address: club_address,
      phone_number: Faker::PhoneNumber.phone_number,
      instagram_link: Faker::Internet.url(host: 'instagram.com', path: "/#{club_info[:name].downcase.gsub(' ', '')}"),
      IBAN: Faker::Bank.iban,
      user: user

    )

    # Create activities for the club
    club_info[:activities].each do |activity_title|
      Activity.create!(
        title: activity_title,
        description: Faker::Lorem.paragraph(sentence_count: 2),
        teacher: Faker::Name.name,
        category: club_info[:category],
        address: brussels_addresses.sample,
        limit: rand(10..30),
        event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
        duration: rand(1..3), # in hours
        club: club
      )
    end
  end
end

puts "Seeded database with users, clubs, and correctly categorized activities based in Brussels!"
