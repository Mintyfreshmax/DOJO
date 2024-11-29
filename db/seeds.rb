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

# Club and activity data for each category
club_data = [
  { name: "Brussels Boxing Club", category: "Boxing", activities: ["Boxing Fundamentals", "Cardio Boxing Blast", "Advanced Sparring Techniques"] },
  { name: "Fit & Fun Yoga Studio", category: "Yoga", activities: ["Morning Vinyasa Flow", "Hot Yoga Session", "Restorative Yoga"] },
  { name: "Brussels Football Academy", category: "Football", activities: ["Youth Football Training", "Goalkeeper Training", "Adult 5-a-Side"] },
  { name: "Tennis Club Louise", category: "Racket", activities: ["Beginner Tennis Lessons", "Intermediate Doubles", "Advanced Tennis Drills"] },
  { name: "Cardio Boost Gym", category: "Cardio", activities: ["High-Intensity Interval Training", "Treadmill Endurance Challenge", "Spin Class Power Hour"] },
  { name: "Weights & Strength Center", category: "Weights", activities: ["Strength Training Basics", "Powerlifting Workshop", "Functional Strength Training"] },
  { name: "Brussels Outdoor Adventures", category: "Outdoor", activities: ["Weekend Hiking Group", "Nature Photography Walk", "Outdoor Bootcamp"] },
  { name: "Aqua Sports Brussels", category: "Water", activities: ["Beginner Swimming Lessons", "Aqua Aerobics", "Water Polo Basics"] }
]

# Ensure 1 user per club (8 users total)
club_data.each do |club_info|
  # Create a user
  user = User.create!(
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )

  # Create the club
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

  # Create exactly 3 activities for each club
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

puts "Seeded database with 8 clubs, 8 users, and 24 activities (3 per category) in Brussels!"
