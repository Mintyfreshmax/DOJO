require 'faker'
require 'open-uri'

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

  # Create exactly 3 activities for each club
    # activity = Activity.new(
    #   title: activity_title,
    #   description: Faker::Lorem.paragraph(sentence_count: 2),
    #   teacher: Faker::Name.name,
    #   category: club_info[:category],
    #   address: brussels_addresses.sample,
    #   limit: rand(10..30),
    #   event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
    #   duration: rand(1..3), # in hours
    #   club: club
    # )


    #  activity= Activity.new(title: ???, description: ???, teacher: ???, category: club_info[:category], address: brussels_addresses.sample, limit: rand(10..30), event_time: Faker::Time.forward(days: rand(1..30), period: :evening), duration: rand(1..3), club: club )
    #  file = URI.parse(??????)
    #  activity.image.attach(io: file, filename: "#{activity.title.parameterize}.jpg", content_type: "image/jpg")


    activity = Activity.new(
      title: "boxing",
      description: "An exciting boxing class just for you.",
      teacher: "Sarah Thompson",
      category: "Boxing",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://media.self.com/photos/587fb60739d082f57cdffb8a/4:3/w_1107,h_830,c_limit/first-boxing-class-boxer-situps.jpg").open
    activity.image.attach(io: file, filename: "evening-boxing-session.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Ballet for Beginners",
      description: "Join us for a gentle introduction to ballet techniques and positions.",
      teacher: "Julia King",
      category: "Dance",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://thedanceacademylehi.com/wp-content/uploads/2022/12/dance-academy-lehi-utah-ballet-solo-1600-sm-b.jpg").open
    activity.image.attach(io: file, filename: "ballet-for-beginners.jpg", content_type: "image/jpg")
    activity.save


    activity = Activity.new(
      title: "Vegan Cooking Class",
      description: "Learn how to prepare healthy and delicious vegan dishes with ease.",
      teacher: "Paulina Reed",
      category: "Cooking",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://thegoodnessproject.co.uk/content/blog/a10c9915-38e1-485a-bda0-0835466205ae.webp").open
    activity.image.attach(io: file, filename: "vegan-cooking-class.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Art Workshop",
      description: "Unleash your creativity in this hands-on art workshop where you’ll learn new techniques.",
      teacher: "Miguel Herrera",
      category: "Art",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/53/50/b8/caption.jpg?w=500&h=400&s=1").open
    activity.image.attach(io: file, filename: "art-workshop.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Fitness Bootcamp",
      description: "Get fit and stay motivated with this intense fitness bootcamp session.",
      teacher: "Jordan Price",
      category: "Fitness",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBehjUQwBmQTJXxSRX22eISfSKe96RkL7IVw&s").open
    activity.image.attach(io: file, filename: "fitness-bootcamp.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Jazz Music Jam",
      description: "Come and jam with fellow jazz lovers in this laid-back music session.",
      teacher: "Liam Parker",
      category: "Music",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx1Dlx5NXOEoArZh3Mob7SZgLuJZUObHu7MQ&s").open
    activity.image.attach(io: file, filename: "jazz-music-jam.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Theater Improv Night",
      description: "Put your creativity to the test in an improv theater session.",
      teacher: "Tina Morgan",
      category: "Theater",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://images.squarespace-cdn.com/content/v1/5f11c649b962926368405be6/1609067262349-31RV6W99M31KQ7I3MB3R/IMG_2569.jpg").open
    activity.image.attach(io: file, filename: "theater-improv-night.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Photography Basics",
      description: "Learn the fundamentals of photography in this beginner-friendly course.",
      teacher: "Rory Miller",
      category: "Photography",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://i.ytimg.com/vi/ujaCbzLwuB8/maxresdefault.jpg").open
    activity.image.attach(io: file, filename: "photography-basics.jpg", content_type: "image/jpg")
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
      club: Club.all.sample
    )
    file = URI.parse("https://i.ytimg.com/vi/BZe4y0Lr-cY/maxresdefault.jpg").open
    activity.image.attach(io: file, filename: "morning-meditation.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Salsa Dance Class",
      description: "Learn the basics of salsa dancing and enjoy the rhythm of Latin music.",
      teacher: "Carlos Diaz",
      category: "Dance",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://www.bailasociety.com/wp-content/uploads/2017/09/ailey.jpg").open
    activity.image.attach(io: file, filename: "salsa-dance-class.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Bread Baking Class",
      description: "Learn how to bake your own artisan bread from scratch.",
      teacher: "David Cook",
      category: "Cooking",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://static01.nyt.com/images/2014/04/23/dining/23BURNER1_SPAN/23BURNER1-superJumbo.jpg").open
    activity.image.attach(io: file, filename: "bread-baking-class.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Watercolor Painting",
      description: "Explore the world of watercolor painting and create your own masterpiece.",
      teacher: "Nina Williams",
      category: "Art",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://i.ytimg.com/vi/VfVcG7FQWfI/sddefault.jpg").open
    activity.image.attach(io: file, filename: "watercolor-painting.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "High-Intensity Interval Training",
      description: "Get your heart pumping in this fast-paced interval training class.",
      teacher: "Max Hunter",
      category: "Fitness",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://www.bodybuilding.com/images/2016/july/high-intensity-interval-training-the-ultimate-guide-tall-v2.jpg").open
    activity.image.attach(io: file, filename: "hiit-training.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Classical Guitar Lessons",
      description: "Learn to play the guitar with this classical guitar course for beginners.",
      teacher: "Sophia Reynolds",
      category: "Music",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://allaboutguitar.co.uk/wp-content/uploads/2024/06/Graded-guitar-lessons-in-Bristol.jpg").open
    activity.image.attach(io: file, filename: "classical-guitar-lessons.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Shakespearean Play Reading",
      description: "Join us for a night of dramatic readings from Shakespeare’s most famous plays.",
      teacher: "Olivia White",
      category: "Theater",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://wp.technologyreview.com/wp-content/uploads/2019/11/ap03071804998-8.jpg").open
    activity.image.attach(io: file, filename: "shakespearean-play-reading.jpg", content_type: "image/jpg")
    activity.save

    activity = Activity.new(
      title: "Landscape Photography",
      description: "Capture stunning landscapes with tips and techniques in this photography workshop.",
      teacher: "Emily Harris",
      category: "Photography",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
      duration: rand(1..3),
      club: Club.all.sample
    )
    file = URI.parse("https://lernvonben.de/cdn/shop/files/Landscape-Photography-for-Beginners-3_1x1_496e6b41-0ab2-4f77-80cc-453bec9b59a4.jpg?v=1724240442").open
    activity.image.attach(io: file, filename: "landscape-photography.jpg", content_type: "image/jpg")

    activity.save


puts "Seeded database with 8 clubs, 8 users, and 24 activities (3 per category) in Brussels!"
