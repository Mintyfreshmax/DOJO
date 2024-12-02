require 'faker'
require 'open-uri'

Booking.destroy_all
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
end


    activity = Activity.new(
      title: "boxing",
      description: "An exciting boxing class just for you.",
      teacher: "Sarah Thompson",
      category: "Boxing",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Brussels Boxing Club")
    )
    file = URI.parse("https://media.self.com/photos/587fb60739d082f57cdffb8a/4:3/w_1107,h_830,c_limit/first-boxing-class-boxer-situps.jpg").open
    activity.image.attach(io: file, filename: "evening-boxing-session.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Ballet for Beginners",
      description: "Join us for a gentle introduction to ballet techniques and positions.",
      teacher: "Julia King",
      category: "Cardio",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Cardio Boost Gym")
    )
    file = URI.parse("https://thedanceacademylehi.com/wp-content/uploads/2022/12/dance-academy-lehi-utah-ballet-solo-1600-sm-b.jpg").open
    activity.image.attach(io: file, filename: "ballet-for-beginners.jpg", content_type: "image/jpg")
    activity.save


    activity = Activity.new(
      title: "Running Class",
      description: "Join our incredible running team and be part of our active family.",
      teacher: "Paulina Reed",
      category: "Outdoor",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Brussels Outdoor Adventures")
    )
    file = URI.parse("https://www.visit.brussels/content/dam/visitbrussels/images/b2c/agenda/que-faire-bruxelles-selection-semaine/2022-09-27/Brussels%20Marathon.jpg").open
    activity.image.attach(io: file, filename: "running-class.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Swimming classes",
      description: "Come join our fun swimming classes where you’ll learn new techniques.",
      teacher: "Miguel Herrera",
      category: "Water",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Aqua Sports Brussels")
    )
    file = URI.parse("https://www.clannlifefitnessashbourne.com/uploads/1/7/3/2/17322990/published/2.jpg?1634821999").open
    activity.image.attach(io: file, filename: "swimming class.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Fitness Bootcamp",
      description: "Get fit and stay motivated with this intense fitness bootcamp session.",
      teacher: "Jordan Price",
      category: "Cardio",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Weights & Strength Center")
    )
    file = URI.parse("https://tunturi.org/Blogs/2021-08/bootcamp-full-body-workout.jpg").open
    activity.image.attach(io: file, filename: "fitness-bootcamp.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Tennis Classes",
      description: "Sign up for our handson Tennis Classes we provide for you.",
      teacher: "Liam Parker",
      category: "Racket",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Tennis Club Louise")
    )
    file = URI.parse("https://images.squarespace-cdn.com/content/v1/5a97763275f9eeee0b6f77f0/31232322-d3b3-498f-89b5-481b08d2d4fc/Are+Private+Tennis+Lessons+Worth+It.jpg").open
    activity.image.attach(io: file, filename: "tennis-class.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Football Club",
      description: "Put yourself to the test and join our Football Club.",
      teacher: "Tina Morgan",
      category: "Football",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Brussels Football Academy")
    )
    file = URI.parse("https://cdn.prod.website-files.com/60c7be61132e3ad0b40a333d/64625e59c52a8cd1a52a3b05_TOCA%20Soccer%20Adult%20League%20Game.jpeg").open
    activity.image.attach(io: file, filename: "Football-club.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Aqua Gym",
      description: "Learn the fundamentals of Aqua Gym in this beginner-friendly course.",
      teacher: "Rory Miller",
      category: "Water",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Aqua Sports Brussels")
    )
    file = URI.parse("https://www.brussels-gym.be/Images/animations/Aspria-Arts-Loi-Aquagym-new-1.jpg").open
    activity.image.attach(io: file, filename: "aqua-gym.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Morning Meditation",
      description: "Start your day with mindfulness and inner peace in this meditation session.",
      teacher: "Emily Walker",
      category: "Yoga",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :morning),
      duration: rand(1..3),
      club: Club.find_by(name: "Fit & Fun Yoga Studio")
    )
    file = URI.parse("https://i.ytimg.com/vi/BZe4y0Lr-cY/maxresdefault.jpg").open
    activity.image.attach(io: file, filename: "morning-meditation.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Salsa Dance Class",
      description: "Learn the basics of salsa dancing and enjoy the rhythm of Latin music.",
      teacher: "Carlos Diaz",
      category: "Cardio",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Cardio Boost Gym")
    )
    file = URI.parse("https://www.bailasociety.com/wp-content/uploads/2017/09/ailey.jpg").open
    activity.image.attach(io: file, filename: "salsa-dance-class.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Paddle Class",
      description: "Join our Paddle Tennis Classes and imrpove your skills.",
      teacher: "David Cook",
      category: "Racket",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club:Club.find_by(name: "Tennis Club Louise")
    )
    file = URI.parse("https://parksports.co.uk/media/images/New-23-24-Update/_1200xAUTO_crop_center-center_none_ns/Park-Sports-Beginner-Padel-Courses.jpg").open
    activity.image.attach(io: file, filename: "Paddle-class.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Hicking Group",
      description: "Explore the world of hicking with us and join our community.",
      teacher: "Nina Williams",
      category: "Outdoor",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Brussels Outdoor Adventures")
    )
    file = URI.parse("https://wildairsports.com/wp-content/uploads/2023/05/Best-hiking-clubs-in-South-Africa-5-1024x768.jpeg").open
    activity.image.attach(io: file, filename: "hicking.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "High-Intensity Interval Training",
      description: "Get your heart pumping in this fast-paced interval training class.",
      teacher: "Max Hunter",
      category: "Weights",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Cardio Boost Gym")
    )
    file = URI.parse("https://www.bodybuilding.com/images/2016/july/high-intensity-interval-training-the-ultimate-guide-tall-v2.jpg").open
    activity.image.attach(io: file, filename: "hit-training.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Kickboxing Classes",
      description: "take your next adventure by joining our Kickboxing classes.",
      teacher: "Sophia Reynolds",
      category: "Boxing",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Brussels Boxing Club")
    )
    file = URI.parse("https://www.verywellfit.com/thmb/JRbC4rCTjzvrGv2zB48icKoGAmY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-970126044-57483916cfa3404baca5727476c4988d.jpg").open
    activity.image.attach(io: file, filename: "kickboxing-class.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Goalkeeper Training",
      description: "Learn nex skills to improve as a Goalkeeper by joining our training.",
      teacher: "Oliver White",
      category: "Football",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Brussels Football Academy")
    )
    file = URI.parse("https://soccercampsinternational.com/wp-content/uploads/2024/09/Goalkeeper-SQ.jpg").open
    activity.image.attach(io: file, filename: "gozlkeeper-training.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Hot Yoga Session",
      description: "Join our Hot Yoga Session for an intense but gratifying workout.",
      teacher: "Emily Harris",
      category: "Yoga",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.find_by(name: "Fit & Fun Yoga Studio")
    )
    file = URI.parse("https://images.squarespace-cdn.com/content/v1/5da72e00195c19564c5d2900/ac901263-7928-4e2b-90dd-8579346ce970/IMG_2681.jpg").open
    activity.image.attach(io: file, filename: "hot-yoga.jpg", content_type: "image/jpg")

    activity.save


puts "Seeded database with 8 clubs, 8 users, and 24 activities (3 per category) in Brussels!"
