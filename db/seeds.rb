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
      description: "Join us for an energizing boxing class that will challenge your limits, improve your strength, and boost your confidence. Whether you're a beginner or experienced, our expert instructor will guide you through every punch, jab, and combo. Expect a dynamic mix of cardio, technique, and strength training, all while having fun and pushing yourself to new heights.",
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
      description: "Step into the world of ballet with this welcoming and supportive class designed for beginners. Learn the foundational techniques, graceful positions, and basic movements in a calm, encouraging environment. Our experienced instructor, Julia King, will guide you through each step, helping you build strength, flexibility, and poise. Whether you're looking to improve posture, increase flexibility, or simply try something new, this class is the perfect introduction to the beauty of ballet.",
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
      description: "Lace up your shoes and join our dynamic running class, where fitness meets fun! Whether you're just starting out or looking to improve your endurance, this class is perfect for runners of all levels. Led by experienced coach Paulina Reed, you'll be part of a supportive and motivating team that will push you to reach new personal bests. Each session includes guided warm-ups, technique tips, and group runs, all set against the beautiful outdoors of Brussels. Get ready to challenge yourself, meet new friends, and experience the thrill of running in nature.",
      teacher: "Paulina Reed",
      category: "Outdoor",
      address: brussels_addresses.sample,
      limit: rand(10..30),
      event_time: Faker::Time.forward(days: rand(1..30), period: :evening),
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
      description: "Dive into a fun and invigorating experience with our swimming classes! Whether you're a beginner or looking to refine your technique, our expert instructor, Miguel Herrera, will guide you every stroke of the way. Improve your swimming skills, build confidence in the water, and learn essential techniques in a supportive and enjoyable environment. From mastering the basics to improving endurance and speed, each class is tailored to help you progress at your own pace. Join us and experience the joy of swimming while getting a full-body workout and building lifelong skills.",
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
      description: "Get ready to push your limits and transform your body with our high-energy Fitness Bootcamp! Led by the experienced Jordan Price, this session is designed to challenge you through a series of intense, full-body exercises that build strength, endurance, and agility. Whether you're aiming to lose weight, build muscle, or just get fitter, this bootcamp will keep you motivated and help you achieve your fitness goals. Expect a mix of cardio, strength training, and functional exercises in a supportive group environment. Don't just train—train with purpose and see results!",
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
      description: "Step onto the court and improve your game with our hands-on tennis classes! Whether you're picking up a racket for the first time or looking to refine your technique, our expert instructor, Liam Parker, will guide you through every serve, forehand, and backhand. In these classes, you'll focus on key skills such as footwork, ball control, and strategy, while building your fitness and confidence on the court. Join us at Tennis Club Louise for a fun, dynamic, and rewarding tennis experience where every level of player is welcome.",
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
      description: "Get in the game and challenge yourself by joining our Football Club! Whether you're a seasoned player or just starting out, our coach Tina Morgan will help you sharpen your skills and take your game to the next level. In each session, you'll focus on key aspects of football, including dribbling, passing, shooting, and teamwork, while engaging in high-intensity drills and friendly matches. This is the perfect opportunity to improve your fitness, build your confidence on the field, and be part of a passionate football community. Come test your limits, make new friends, and enjoy the thrill of the beautiful game!",
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
      description: "Dive into fitness with our beginner-friendly Aqua Gym course! Led by instructor Rory Miller, this class combines the benefits of water resistance with fun, low-impact exercises to improve your strength, flexibility, and cardiovascular health. Aqua Gym is perfect for those looking to stay active without stressing their joints, making it an ideal choice for all fitness levels. Whether you're new to exercise or want to add variety to your routine, you'll enjoy a refreshing workout in a supportive environment. Join us at Aqua Sports Brussels for a unique, energizing experience that will leave you feeling revitalized!",
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
      description: "Start your day with a sense of calm and clarity in our peaceful Morning Meditation session. Led by Emily Walker, this guided meditation will help you cultivate mindfulness, reduce stress, and center your mind before you begin your daily activities. Whether you're new to meditation or have practiced before, this class is designed to help you reconnect with your breath, embrace stillness, and find inner peace. Join us at Fit & Fun Yoga Studio for a rejuvenating morning experience that will set a positive tone for the rest of your day.",
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
      description: "Feel the rhythm, move to the beat, and learn the art of salsa dancing in this high-energy class! Led by Carlos Diaz, this session will introduce you to the fundamental steps and techniques of salsa, all set to the vibrant, infectious rhythms of Latin music. Whether you're a complete beginner or looking to refine your moves, this class is designed to get you dancing with confidence while having fun. Get ready to embrace the music, improve your fitness, and enjoy an exciting cardio workout in a lively and supportive environment. Join us at Cardio Boost Gym for a dance experience like no other!",
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
      description: "Join our Paddle Tennis Classes and take your skills to the next level! Led by experienced coach David Cook, this class is perfect for beginners and intermediate players looking to refine their technique and strategy. Paddle tennis is a fun, fast-paced sport that combines elements of tennis and squash, and it's easier to pick up than you might think. Whether you're working on your serve, improving your footwork, or learning the rules of the game, you'll enjoy every moment on the court. Come to Tennis Club Louise for a social, energetic experience where you’ll build your skills, boost your fitness, and have a great time!",
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
      description: "Explore the great outdoors and connect with nature by joining our Hiking Group! Led by Nina Williams, this group is perfect for nature lovers and adventure seekers of all experience levels. Whether you're an experienced hiker or a beginner, our hikes will take you through stunning trails and scenic landscapes, while providing a great way to meet new people and stay active. With each hike, you'll experience the beauty of nature, improve your fitness, and enjoy the sense of community that comes with exploring the outdoors together. Join us at Brussels Outdoor Adventures for an unforgettable journey through nature!",
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
      description: "Get ready to push your limits in our High-Intensity Interval Training (HIIT) class! Led by Max Hunter, this fast-paced workout combines short bursts of intense activity with brief recovery periods to help you burn fat, build strength, and improve endurance in record time. Whether you're aiming for weight loss, muscle tone, or just a heart-pumping workout, HIIT delivers results. No matter your fitness level, you'll be challenged and supported in this high-energy class, all while enjoying a fun and motivating atmosphere. Join us at Cardio Boost Gym for a workout that will leave you feeling stronger, fitter, and more energized!",
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
      description: "Step into the ring and take your fitness to the next level with our dynamic Kickboxing classes! Led by Sophia Reynolds, this high-energy class combines the power of boxing with the speed and agility of martial arts. Whether you're looking to get in shape, learn self-defense, or relieve stress, kickboxing is the perfect way to challenge yourself both physically and mentally. With a focus on technique, strength, and endurance, you'll gain confidence while getting a full-body workout that burns calories, tones muscles, and improves coordination. Join us at Brussels Boxing Club for an intense and fun experience that will leave you feeling empowered and ready for anything!",
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
      description: "Step up your game with our specialized Goalkeeper Training sessions! Led by Oliver White, this class focuses on developing the unique skills and techniques required to be a top-level goalkeeper. From positioning and shot-stopping to diving and ball distribution, you'll learn key strategies that will elevate your performance on the field. Whether you're new to goalkeeping or looking to refine your skills, our sessions are designed to push you to your limits, build your confidence, and enhance your agility. Join us at Brussels Football Academy and become the last line of defense with expert coaching and intense practice!",
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
      description: "Experience the perfect blend of intensity and relaxation in our Hot Yoga Session! Led by Emily Harris, this invigorating practice takes place in a heated room to help increase flexibility, improve circulation, and detoxify the body through sweat. Whether you're a seasoned yogi or new to hot yoga, this class will challenge your body, calm your mind, and leave you feeling rejuvenated. The warmth of the room deepens your stretches, enhances muscle recovery, and boosts cardiovascular health. Join us at Fit & Fun Yoga Studio for a rewarding, full-body workout that will leave you feeling both stronger and more relaxed.",
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
