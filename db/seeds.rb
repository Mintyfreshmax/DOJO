require 'faker'
require 'open-uri'

Feedback.destroy_all
Booking.destroy_all
Activity.destroy_all
Club.destroy_all
User.destroy_all

puts "Old data cleared."

# USERS:

# Create 300 random users
random_users = []
specific_users = []

# Create 300 random users
5.times do
  random_users << User.create!(
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
end

# Create 8 specific users
[
  { first_name: "Salman", last_name: "Tsagaraev", username: "salman-thegreat", email: "salman@dojo.com", image_url: "https://res.cloudinary.com/dyxtpmvte/image/upload/v1733326081/salman_cecjzm.png" },
  { first_name: "Maximilian", last_name: "Conru", username: "Myntiefreshmax", email: "max@dojo.com", image_url: "https://res.cloudinary.com/dyxtpmvte/image/upload/v1733326081/max_ywxl6b.png" },
  { first_name: "François", last_name: "Catelas", username: "francois-le-francais", email: "francois@dojo.com", image_url: "https://res.cloudinary.com/dyxtpmvte/image/upload/v1733326080/francois_tdcw4k.png" },
  { first_name: "Sandor", last_name: "Lazar", username: "salaz-art", email: "sandor@dojo.com", image_url: "https://res.cloudinary.com/dyxtpmvte/image/upload/v1733326080/sandor_l1vbr8.png" },
  { first_name: "Babadi", last_name: "MUKANYA", username: "baba-king", email: "babadi@dojo.com", image_url: "https://res.cloudinary.com/dyxtpmvte/image/upload/v1733326081/babadi_xp0t82.png" },
  { first_name: "Pedro", last_name: "Vilarinho", username: "pedro-pan", email: "pedro@dojo.com", image_url: "https://res.cloudinary.com/dyxtpmvte/image/upload/v1733326080/pedro_qtpoop.png" },
  { first_name: "Madeleine", last_name: "de Kerchove", username: "queenmaddie", email: "maddie@dojo.com", image_url: "https://res.cloudinary.com/dyxtpmvte/image/upload/v1733326080/madeleine_x15aru.png" },
  { first_name: "Leonidas", last_name: "Zamora", username: "leonardo-di-carpaccio", email: "leo@dojo.com", image_url: "https://res.cloudinary.com/dyxtpmvte/image/upload/v1733326080/leonidas_s8zhx2.png" }
].each do |user_data|
  specific_user = User.new(
    first_name: user_data[:first_name],
    last_name: user_data[:last_name],
    username: user_data[:username],
    email: user_data[:email],
    password: "123456"
  )
  file = URI.parse(user_data[:image_url]).open
  specific_user.image.attach(io: file, filename: "#{user_data[:username]}.jpg", content_type: "image/jpg")
  specific_user.save
  specific_users << specific_user
end

puts "300 random users & 8 specific ones created 🍹"

# CLUBS:

club = Club.new(
  name: "Brussels Boxing Club",
  address: "Rue Antoine Dansaert 50, 1000 Brussels, Belgium",
  user: User.find_by(username: "salman-thegreat"),
  details: "The premier boxing destination in Brussels. Join our expert-led sessions to build strength, endurance, and confidence in a vibrant and inclusive community.",
  instagram_link: "brusselsboxing",
  phone_number: "0468123456",
  IBAN: Faker::Bank.iban(country_code: "BE")
)
file = URI.parse("https://bad.brussels/user/pages/01.places/96.Bruxelles%20Bagarre%20Club/nemesis.png").open
club.image.attach(io: file, filename: "Brussels_boxing.png", content_type: "image/png")
club.save

club = Club.new(
  name: "Fit & Fun Yoga Studio",
  address: "Quai au Bois à Brûler 39B, 1000 Bruxelles",
  user: User.find_by(username: "Myntiefreshmax"),
  details: "Find your balance at Fit & Fun Yoga Studio, where tranquility meets fitness. Enjoy diverse classes tailored for all levels in a serene setting.",
  instagram_link: "pilateswithmaddie",
  phone_number: "0475123456",
  IBAN: Faker::Bank.iban(country_code: "BE")
)
file = URI.parse("https://images.squarespace-cdn.com/content/v1/619b80c86cb83b26d3257984/0be91c21-82bd-4510-9e66-c01b186db4a9/202406_BYL_014_WEB.jpg").open
club.image.attach(io: file, filename: "Fit_fun.jpg", content_type: "image/jpg")
club.save

club = Club.new(
  name: "Brussels Football Academy",
  address: "Boulevard Anspach 20, 1000 Brussels, Belgium",
  user: User.find_by(username: "baba-king"),
  details: "The go-to place for football enthusiasts. Enhance your skills, join friendly matches, and be part of an energetic football-loving community.",
  instagram_link: "brusselsfootball",
  phone_number: "0486123456",
  IBAN: Faker::Bank.iban(country_code: "BE")
)
file = URI.parse("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmbNmwb7UTLm_wrtJW83nwRpfucUCQNNmbKQ&s").open
club.image.attach(io: file, filename: "Brussels_boxing.jpg", content_type: "image/jpg")
club.save

club = Club.new(
  name: "Tennis Club Louise",
  address: "Parc du Cinquantenaire, 1000 Brussels, Belgium",
  user: User.find_by(username: "salaz-art"),
  details: "Perfect your game at Tennis Club Louise. With state-of-the-art courts and expert coaching, enjoy tennis like never before.",
  instagram_link: "tennislouise",
  phone_number: "0499123456",
  IBAN: Faker::Bank.iban(country_code: "BE")
)
file = URI.parse("https://rockfieldtennisclub.ie/wp-content/uploads/2023/05/RockfieldLogo.png").open
club.image.attach(io: file, filename: "Tennis_louise.png", content_type: "image/png")
club.save

club = Club.new(
  name: "Cardio Boost Gym",
  address: "Chaussée de Charleroi 75, 1060 Brussels, Belgium",
  user: User.find_by(username: "leonardo-di-carpaccio"),
  details: "Elevate your fitness journey with Cardio Boost Gym. Our high-energy workouts are designed to improve endurance and burn calories.",
  instagram_link: "cardioboost",
  phone_number: "0467123456",
  IBAN: Faker::Bank.iban(country_code: "BE")
)
file = URI.parse("https://as1.ftcdn.net/v2/jpg/02/97/33/22/1000_F_297332294_ppGVE6QmDdjMoXw8hdgeJOhclbwTvJsa.jpg").open
club.image.attach(io: file, filename: "Cardio_boost.jpg", content_type: "image/jpg")
club.save

club = Club.new(
  name: "Weights & Strength Center",
  address: "Rue Neuve 123, 1000 Brussels, Belgium",
  user: User.find_by(username: "pedro-pan"),
  details: "Build strength and confidence at Weights & Strength Center. From beginners to pros, we offer expert guidance and top-tier equipment.",
  instagram_link: "strengthwithpedro",
  phone_number: "0471123456",
  IBAN: Faker::Bank.iban(country_code: "BE")
)
file = URI.parse("https://img.freepik.com/premium-photo/photo-fitness-center-with-dumbbells-strength-training-equipments_763111-333744.jpg").open
club.image.attach(io: file, filename: "Weights_strength.jpg", content_type: "image/jpg")
club.save

club = Club.new(
  name: "Brussels Outdoor Adventures",
  address: "Avenue Louise 105, 1050 Brussels, Belgium",
  user: User.find_by(username: "queenmaddie"),
  details: "Discover the thrill of nature with Brussels Outdoor Adventures. Join hikes, runs, and outdoor fun to stay active and explore.",
  instagram_link: "outdoorbrussels",
  phone_number: "0465123456",
  IBAN: Faker::Bank.iban(country_code: "BE")
)
file = URI.parse("https://outdooradventureclub.com/wp-content/uploads/2021/08/OAC-logo-no-url-or-tagline-clear-Aug-15.png").open
club.image.attach(io: file, filename: "Brussels_outdoor.png", content_type: "image/png")
club.save

club = Club.new(
  name: "Aqua Sports Brussels",
  address: "Grand Place, 1000 Brussels, Belgium",
  user: User.find_by(username: "francois-le-francais"),
  details: "Dive into fun and fitness with Aqua Sports Brussels. Experience water sports, swimming lessons, and aquatic workouts for all levels.",
  instagram_link: "aquasportsbrussels",
  phone_number: "0498123456",
  IBAN: Faker::Bank.iban(country_code: "BE")
)
file = URI.parse("https://www.worldclassfitness.be/wp-content/uploads/2016/10/iconuri-02.png").open
club.image.attach(io: file, filename: "Aqua_sports.png", content_type: "image/png")
club.save

puts "8 clubs created 🏓"


# ACTIVITIES:

# Boxing activities

activity = Activity.new(
  title: "Kickboxing Classes",
  description: "Step into the ring and take your fitness to the next level with our dynamic Kickboxing classes! Led by Sophia Reynolds, this high-energy class combines the power of boxing with the speed and agility of martial arts. Whether you're looking to get in shape, learn self-defense, or relieve stress, kickboxing is the perfect way to challenge yourself both physically and mentally. With a focus on technique, strength, and endurance, you'll gain confidence while getting a full-body workout that burns calories, tones muscles, and improves coordination. Join us at Brussels Boxing Club for an intense and fun experience that will leave you feeling empowered and ready for anything!",
  teacher: "Sophia Reynolds",
  category: "Boxing",
  address: "Rue des Palais 120, 1030 Schaerbeek",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Brussels Boxing Club")
)
file = URI.parse("https://www.verywellfit.com/thmb/JRbC4rCTjzvrGv2zB48icKoGAmY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-970126044-57483916cfa3404baca5727476c4988d.jpg").open
activity.image.attach(io: file, filename: "kickboxing-class.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "MMA classes",
  description: "Join us for an energizing MMA class that will challenge your limits, improve your strength, and boost your confidence. Whether you're a beginner or experienced, our expert instructor will guide you through every punch, jab, and combo. Expect a dynamic mix of cardio, technique, and strength training, all while having fun and pushing yourself to new heights.",
  teacher: "Sarah Thompson",
  category: "Boxing",
  address: "Rue des Palais 120, 1030 Schaerbeek",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Brussels Boxing Club")
)

file = URI.parse("https://titleboxingclub.com/wp-content/uploads/2022/08/MMA_VideoThumbnail.jpg").open
activity.image.attach(io: file, filename: "MMA-session.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Boxing",
  description: "Join us for an energizing boxing class that will challenge your limits, improve your strength, and boost your confidence. Whether you're a beginner or experienced, our expert instructor will guide you through every punch, jab, and combo. Expect a dynamic mix of cardio, technique, and strength training, all while having fun and pushing yourself to new heights.",
  teacher: "Sarah Thompson",
  category: "Boxing",
  address: "Rue des Palais 120, 1030 Schaerbeek",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) - 1.days,
  duration: rand(1..3),
  club: Club.find_by(name: "Brussels Boxing Club")
)
file = URI.parse("https://media.self.com/photos/587fb60739d082f57cdffb8a/4:3/w_1107,h_830,c_limit/first-boxing-class-boxer-situps.jpg").open
activity.image.attach(io: file, filename: "evening-boxing-session.jpg", content_type: "image/jpg")
activity.save

# Cardio activities

activity = Activity.new(
  title: "Salsa Dance Class",
  description: "Feel the rhythm, move to the beat, and learn the art of salsa dancing in this high-energy class! Led by Carlos Diaz, this session will introduce you to the fundamental steps and techniques of salsa, all set to the vibrant, infectious rhythms of Latin music. Whether you're a complete beginner or looking to refine your moves, this class is designed to get you dancing with confidence while having fun. Get ready to embrace the music, improve your fitness, and enjoy an exciting cardio workout in a lively and supportive environment. Join us at Cardio Boost Gym for a dance experience like no other!",
  teacher: "Carlos Diaz",
  category: "Cardio",
  address: "Galerie des Princes 5, 1000 Bruxelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Cardio Boost Gym")
)
file = URI.parse("https://www.bailasociety.com/wp-content/uploads/2017/09/ailey.jpg").open
activity.image.attach(io: file, filename: "salsa-dance-class.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Cycling class",
  description: "Pedal into the world of cycling with this welcoming and supportive class designed for beginners. Learn the fundamental techniques, cycling positions, and basic movements in a fun and motivating environment. Our experienced instructor, Julia King, will guide you through each step, helping you build endurance, strength, and confidence on the bike. Whether you're looking to improve your fitness, increase stamina, or simply try something new, this class is the perfect introduction to the exciting world of cycling.",
  teacher: "Julia King",
  category: "Cardio",
  address: "Galerie des Princes 5, 1000 Bruxelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Cardio Boost Gym")
)
file = URI.parse("https://images.squarespace-cdn.com/content/v1/5c8cfa05fd679378b9b8d9df/1696262545311-I1OU9RZ0DENS2R5WAFST/_DSF7061.jpg?format=2500w").open
activity.image.attach(io: file, filename: "cycling-class.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Spin Class",
  description: "Dive into the energy and excitement of a spin class, where high-intensity cycling meets upbeat music and an electrifying atmosphere. Perfect for those looking to push their limits, this class will help you burn calories, improve endurance, and build strength. Led by the dynamic instructor, Julia King, you'll be guided through sprints, climbs, and intervals, all tailored to challenge and inspire. No matter your experience level, this spin class guarantees a heart-pumping workout that leaves you feeling accomplished and motivated.",
  teacher: "Julia King",
  category: "Cardio",
  address: "Galerie des Princes 5, 1000 Bruxelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) - 1.days,
  duration: rand(1..3),
  club: Club.find_by(name: "Cardio Boost Gym")
)

file = URI.parse("https://sport.brussels/media/jhdeplxv/spinning.jpg").open
activity.image.attach(io: file, filename: "spin-class.jpg", content_type: "image/jpg")
activity.save

# Outdoor activities

activity = Activity.new(
  title: "Hicking Group",
  description: "Explore the great outdoors and connect with nature by joining our Hiking Group! Led by Nina Williams, this group is perfect for nature lovers and adventure seekers of all experience levels. Whether you're an experienced hiker or a beginner, our hikes will take you through stunning trails and scenic landscapes, while providing a great way to meet new people and stay active. With each hike, you'll experience the beauty of nature, improve your fitness, and enjoy the sense of community that comes with exploring the outdoors together. Join us at Brussels Outdoor Adventures for an unforgettable journey through nature!",
  teacher: "Nina Williams",
  category: "Outdoor",
  address: "Sonian Forest, Bruxelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Brussels Outdoor Adventures")
)
file = URI.parse("https://wildairsports.com/wp-content/uploads/2023/05/Best-hiking-clubs-in-South-Africa-5-1024x768.jpeg").open
activity.image.attach(io: file, filename: "hicking.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Running Class",
  description: "Lace up your shoes and join our dynamic running class, where fitness meets fun! Whether you're just starting out or looking to improve your endurance, this class is perfect for runners of all levels. Led by experienced coach Paulina Reed, you'll be part of a supportive and motivating team that will push you to reach new personal bests. Each session includes guided warm-ups, technique tips, and group runs, all set against the beautiful outdoors of Brussels. Get ready to challenge yourself, meet new friends, and experience the thrill of running in nature.",
  teacher: "Paulina Reed",
  category: "Outdoor",
  address: "Bois de la Cambre, 1180 Brussels, Belgium",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Brussels Outdoor Adventures")
)
file = URI.parse("https://www.visit.brussels/content/dam/visitbrussels/images/b2c/agenda/que-faire-bruxelles-selection-semaine/2022-09-27/Brussels%20Marathon.jpg").open
activity.image.attach(io: file, filename: "running-class.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Trail Running Adventure",
  description: "Experience the beauty of nature while improving your fitness with our Trail Running Adventure class! This session is perfect for outdoor enthusiasts and runners who love a challenge. Under the expert guidance of coach Paulina Reed, you'll navigate scenic trails, conquer varying terrains, and boost your stamina. Each session begins with a warm-up and includes tips on technique and pacing for trail running. Join a vibrant group of like-minded runners and enjoy the thrill of exploring Brussels' picturesque landscapes on foot.",
  teacher: "Paulina Reed",
  category: "Outdoor",
  address: "Sonian Forest, Bruxelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) - 1.days,
  duration: rand(1..3),
  club: Club.find_by(name: "Brussels Outdoor Adventures")
)

file = URI.parse("https://www.visit.brussels/content/dam/visitbrussels/images/b2c/what-to-do/parcours-jogging/les-plus-beaux-parcours-de-jogging-de-bruxelles-foret-de-soignes-2.jpg").open
activity.image.attach(io: file, filename: "trail-running-adventure.jpg", content_type: "image/jpg")
activity.save

# Water activities

activity = Activity.new(
  title: "Aqua Gym",
  description: "Dive into fitness with our beginner-friendly Aqua Gym course! Led by instructor Rory Miller, this class combines the benefits of water resistance with fun, low-impact exercises to improve your strength, flexibility, and cardiovascular health. Aqua Gym is perfect for those looking to stay active without stressing their joints, making it an ideal choice for all fitness levels. Whether you're new to exercise or want to add variety to your routine, you'll enjoy a refreshing workout in a supportive environment. Join us at Aqua Sports Brussels for a unique, energizing experience that will leave you feeling revitalized!",
  teacher: "Rory Miller",
  category: "Water",
  address: "Avenue Léopold Wiener 60, 1170 Watermael-Boitsfort",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Aqua Sports Brussels")
)
file = URI.parse("https://www.brussels-gym.be/Images/animations/Aspria-Arts-Loi-Aquagym-new-1.jpg").open
activity.image.attach(io: file, filename: "aqua-gym.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Swimming classes",
  description: "Dive into a fun and invigorating experience with our swimming classes! Whether you're a beginner or looking to refine your technique, our expert instructor, Miguel Herrera, will guide you every stroke of the way. Improve your swimming skills, build confidence in the water, and learn essential techniques in a supportive and enjoyable environment. From mastering the basics to improving endurance and speed, each class is tailored to help you progress at your own pace. Join us and experience the joy of swimming while getting a full-body workout and building lifelong skills.",
  teacher: "Miguel Herrera",
  category: "Water",
  address: "Avenue Léopold Wiener 60, 1170 Watermael-Boitsfort",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Aqua Sports Brussels")
)
file = URI.parse("https://www.clannlifefitnessashbourne.com/uploads/1/7/3/2/17322990/published/2.jpg?1634821999").open
activity.image.attach(io: file, filename: "swimming class.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Advanced Swimming Techniques",
  description: "Take your swimming skills to the next level with our Advanced Swimming Techniques class! Perfect for those who are already comfortable in the water, this session focuses on refining strokes, improving speed, and mastering advanced techniques like flip turns and efficient breathing. Led by our experienced instructor, Miguel Herrera, you'll receive personalized guidance to boost your performance and confidence in the pool. Whether you're training for a competition or simply looking to perfect your form, this class is tailored to help you achieve your goals.",
  teacher: "Miguel Herrera",
  category: "Water",
  address: "Avenue Léopold Wiener 60, 1170 Watermael-Boitsfort",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) - 1.days,
  duration: rand(1..3),
  club: Club.find_by(name: "Aqua Sports Brussels")
)

file = URI.parse("https://sport.brussels/media/saooh0d2/synchronized-swimming-2637918_1920.jpg").open
activity.image.attach(io: file, filename: "advanced-swimming-techniques.jpg", content_type: "image/jpg")
activity.save

# Weights activities

activity = Activity.new(
  title: "High-Intensity Interval Training",
  description: "Get ready to push your limits in our High-Intensity Interval Training (HIIT) class! Led by Max Hunter, this fast-paced workout combines short bursts of intense activity with brief recovery periods to help you burn fat, build strength, and improve endurance in record time. Whether you're aiming for weight loss, muscle tone, or just a heart-pumping workout, HIIT delivers results. No matter your fitness level, you'll be challenged and supported in this high-energy class, all while enjoying a fun and motivating atmosphere. Join us at Cardio Boost Gym for a workout that will leave you feeling stronger, fitter, and more energized!",
  teacher: "Max Hunter",
  category: "Weights",
  address: "Rue Lens 26, 1050 Ixelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Cardio Boost Gym")
)
file = URI.parse("https://www.bodybuilding.com/images/2016/july/high-intensity-interval-training-the-ultimate-guide-tall-v2.jpg").open
activity.image.attach(io: file, filename: "hit-training.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Fitness Bootcamp",
  description: "Get ready to push your limits and transform your body with our high-energy Fitness Bootcamp! Led by the experienced Jordan Price, this session is designed to challenge you through a series of intense, full-body exercises that build strength, endurance, and agility. Whether you're aiming to lose weight, build muscle, or just get fitter, this bootcamp will keep you motivated and help you achieve your fitness goals. Expect a mix of cardio, strength training, and functional exercises in a supportive group environment. Don't just train—train with purpose and see results!",
  teacher: "Jordan Price",
  category: "Weights",
  address: "Rue Lens 26, 1050 Ixelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Weights & Strength Center")
)
file = URI.parse("https://tunturi.org/Blogs/2021-08/bootcamp-full-body-workout.jpg").open
activity.image.attach(io: file, filename: "fitness-bootcamp.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Go Raw Fitness",
  description: "Elevate your fitness with our Strength Training Circuit class, a dynamic and challenging workout designed to build muscle and improve functional strength. Guided by expert trainer Jordan Price, this session combines weightlifting, resistance exercises, and bodyweight movements in a circuit-style format to maximize results. Perfect for all fitness levels, you'll receive personalized guidance and motivation to help you push past your limits. Whether you're looking to tone up, increase strength, or enhance overall fitness, this class is your pathway to achieving your goals.",
  teacher: "Jordan Price",
  category: "Weights",
  address: "Rue Lens 26, 1050 Ixelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) - 1.days,
  duration: rand(1..3),
  club: Club.find_by(name: "Weights & Strength Center")
)

file = URI.parse("https://blog.nasm.org/hubfs/circuit-training.jpg").open
activity.image.attach(io: file, filename: "strength-training-circuit.jpg", content_type: "image/jpg")
activity.save

# Racket activities

activity = Activity.new(
  title: "Paddle Class",
  description: "Join our Paddle Tennis Classes and take your skills to the next level! Led by experienced coach David Cook, this class is perfect for beginners and intermediate players looking to refine their technique and strategy. Paddle tennis is a fun, fast-paced sport that combines elements of tennis and squash, and it's easier to pick up than you might think. Whether you're working on your serve, improving your footwork, or learning the rules of the game, you'll enjoy every moment on the court. Come to Tennis Club Louise for a social, energetic experience where you’ll build your skills, boost your fitness, and have a great time!",
  teacher: "David Cook",
  category: "Racket",
  address: "Sq. du Vieux Tilleul 11, 1050 Ixelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club:Club.find_by(name: "Tennis Club Louise")
)
file = URI.parse("https://parksports.co.uk/media/images/New-23-24-Update/_1200xAUTO_crop_center-center_none_ns/Park-Sports-Beginner-Padel-Courses.jpg").open
activity.image.attach(io: file, filename: "Paddle-class.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Tennis Classes",
  description: "Step onto the court and improve your game with our hands-on tennis classes! Whether you're picking up a racket for the first time or looking to refine your technique, our expert instructor, Liam Parker, will guide you through every serve, forehand, and backhand. In these classes, you'll focus on key skills such as footwork, ball control, and strategy, while building your fitness and confidence on the court. Join us at Tennis Club Louise for a fun, dynamic, and rewarding tennis experience where every level of player is welcome.",
  teacher: "Liam Parker",
  category: "Racket",
  address: "Sq. du Vieux Tilleul 11, 1050 Ixelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Tennis Club Louise")
)
file = URI.parse("https://images.squarespace-cdn.com/content/v1/5a97763275f9eeee0b6f77f0/31232322-d3b3-498f-89b5-481b08d2d4fc/Are+Private+Tennis+Lessons+Worth+It.jpg").open
activity.image.attach(io: file, filename: "tennis-class.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Doubles Tennis Strategy",
  description: "Take your doubles game to the next level with our specialized Doubles Tennis Strategy class! Led by expert coach Liam Parker, this session focuses on teamwork, positioning, and tactics to help you and your partner dominate the court. Learn how to communicate effectively, anticipate your opponents' moves, and master advanced doubles techniques. Perfect for intermediate and advanced players, this class will sharpen your skills and boost your confidence in doubles play. Join us at Tennis Club Louise for a fun and challenging experience tailored to enhance your competitive edge.",
  teacher: "Liam Parker",
  category: "Racket",
  address: "Sq. du Vieux Tilleul 11, 1050 Ixelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) - 1.days,
  duration: rand(1..3),
  club: Club.find_by(name: "Tennis Club Louise")
)

file = URI.parse("https://abispearstennis.com/wp-content/uploads/2021/09/abi-spears-tennis-doubles-tennis-for-adults-1c.jpg").open
activity.image.attach(io: file, filename: "doubles-tennis-strategy.jpg", content_type: "image/jpg")
activity.save

# Football activities

activity = Activity.new(
  title: "Goalkeeper Training",
  description: "Step up your game with our specialized Goalkeeper Training sessions! Led by Oliver White, this class focuses on developing the unique skills and techniques required to be a top-level goalkeeper. From positioning and shot-stopping to diving and ball distribution, you'll learn key strategies that will elevate your performance on the field. Whether you're new to goalkeeping or looking to refine your skills, our sessions are designed to push you to your limits, build your confidence, and enhance your agility. Join us at Brussels Football Academy and become the last line of defense with expert coaching and intense practice!",
  teacher: "Oliver White",
  category: "Football",
  address: "Boulevard du Triomphe, toegang 8, 1040 Ixelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Brussels Football Academy")
)
file = URI.parse("https://soccercampsinternational.com/wp-content/uploads/2024/09/Goalkeeper-SQ.jpg").open
activity.image.attach(io: file, filename: "gozlkeeper-training.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Football Club",
  description: "Get in the game and challenge yourself by joining our Football Club! Whether you're a seasoned player or just starting out, our coach Tina Morgan will help you sharpen your skills and take your game to the next level. In each session, you'll focus on key aspects of football, including dribbling, passing, shooting, and teamwork, while engaging in high-intensity drills and friendly matches. This is the perfect opportunity to improve your fitness, build your confidence on the field, and be part of a passionate football community. Come test your limits, make new friends, and enjoy the thrill of the beautiful game!",
  teacher: "Tina Morgan",
  category: "Football",
  address: "Boulevard du Triomphe, toegang 8, 1040 Ixelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Brussels Football Academy")
)
file = URI.parse("https://cdn.prod.website-files.com/60c7be61132e3ad0b40a333d/64625e59c52a8cd1a52a3b05_TOCA%20Soccer%20Adult%20League%20Game.jpeg").open
activity.image.attach(io: file, filename: "Football-club.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Football Skills Masterclass",
  description: "Elevate your game with our Football Skills Masterclass, a specialized session designed to refine your techniques and tactical understanding. Led by expert coach Tina Morgan, this masterclass focuses on advanced dribbling, precision passing, strategic positioning, and shooting accuracy. Perfect for intermediate and advanced players, you'll participate in high-intensity drills, scenario-based practice, and small-sided games to enhance your performance on the field. Join us at Brussels Football Academy and become a more confident and skilled footballer while enjoying the camaraderie of like-minded players.",
  teacher: "Tina Morgan",
  category: "Football",
  address: "Boulevard du Triomphe, toegang 8, 1040 Ixelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) - 1.days,
  duration: rand(1..3),
  club: Club.find_by(name: "Brussels Football Academy")
)

file = URI.parse("https://i.ytimg.com/vi/xiDsGS4CKXE/hq720.jpg").open
activity.image.attach(io: file, filename: "football-skills-masterclass.jpg", content_type: "image/jpg")
activity.save

# Yoga activities

activity = Activity.new(
  title: "Morning Meditation",
  description: "Start your day with a sense of calm and clarity in our peaceful Morning Meditation session. Led by Emily Walker, this guided meditation will help you cultivate mindfulness, reduce stress, and center your mind before you begin your daily activities. Whether you're new to meditation or have practiced before, this class is designed to help you reconnect with your breath, embrace stillness, and find inner peace. Join us at Fit & Fun Yoga Studio for a rejuvenating morning experience that will set a positive tone for the rest of your day.",
  teacher: "Emily Walker",
  category: "Yoga",
  address: "Bois de la Cambre, 1180 Brussels, Belgium",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Fit & Fun Yoga Studio")
)
file = URI.parse("https://i.ytimg.com/vi/BZe4y0Lr-cY/maxresdefault.jpg").open
activity.image.attach(io: file, filename: "morning-meditation.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Hot Yoga Session",
  description: "Experience the perfect blend of intensity and relaxation in our Hot Yoga Session! Led by Emily Harris, this invigorating practice takes place in a heated room to help increase flexibility, improve circulation, and detoxify the body through sweat. Whether you're a seasoned yogi or new to hot yoga, this class will challenge your body, calm your mind, and leave you feeling rejuvenated. The warmth of the room deepens your stretches, enhances muscle recovery, and boosts cardiovascular health. Join us at Fit & Fun Yoga Studio for a rewarding, full-body workout that will leave you feeling both stronger and more relaxed.",
  teacher: "Emily Harris",
  category: "Yoga",
  address: "Quai au Bois à Brûler 39B, 1000 Bruxelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) + rand(1..30).days,
  duration: rand(1..3),
  club: Club.find_by(name: "Fit & Fun Yoga Studio")
)
file = URI.parse("https://images.squarespace-cdn.com/content/v1/5da72e00195c19564c5d2900/ac901263-7928-4e2b-90dd-8579346ce970/IMG_2681.jpg").open
activity.image.attach(io: file, filename: "hot-yoga.jpg", content_type: "image/jpg")
activity.save

activity = Activity.new(
  title: "Vinyasa Flow Yoga",
  description: "Unwind and recharge with our Vinyasa Flow Yoga class, a dynamic practice designed to synchronize movement with breath. Led by Emily Harris, this session is perfect for yogis of all levels, offering a flowing sequence of poses that promote strength, flexibility, and mindfulness. You'll transition smoothly between postures, building heat in the body while cultivating a sense of inner calm. Whether you're seeking to deepen your practice or find a peaceful escape from your busy day, this class at Fit & Fun Yoga Studio provides a harmonious balance of challenge and relaxation.",
  teacher: "Emily Harris",
  category: "Yoga",
  address: "Quai au Bois à Brûler 39B, 1000 Bruxelles",
  limit: rand(10..30),
  event_time: Time.new(Date.today.year, Date.today.month, Date.today.day, 19, 0) - 1.days,
  duration: rand(1..3),
  club: Club.find_by(name: "Fit & Fun Yoga Studio")
)

file = URI.parse("https://yogapractice.com/wp-content/uploads/2019/04/10-Things-You-Need-To-Know-About-Vinyasa-Flow.jpg").open
activity.image.attach(io: file, filename: "vinyasa-flow-yoga.jpg", content_type: "image/jpg")
activity.save

puts "24 activities created 🔥"

# BOOKINGS:

# Specific users bookings

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Kickboxing Classes")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "MMA classes")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  activity = Activity.find_by(title: "Boxing")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  activity = Activity.find_by(title: "Cycling class")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Spin class")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Hicking Group")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Running Class")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Trail Running Adventure")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Aqua Gym")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Advanced Swimming Techniques")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Swimming classes")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "High-Intensity Interval Training")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Fitness Bootcamp")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Go Raw Fitness")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Paddle Class")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  activity = Activity.find_by(title: "Tennis Class")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Doubles Tennis Strategy")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Goalkeeper Training")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Football Club")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Football Skills Masterclass")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  activity = Activity.find_by(title: "Morning Meditation")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Hot Yoga Session")
  Booking.create(
    user: user,
    activity: activity
  )
end

specific_users.each do |user|
  next if user.email == "maddie@dojo.com"

  activity = Activity.find_by(title: "Vinyasa Flow Yoga")
  Booking.create(
    user: user,
    activity: activity
  )
end

# Random users bookings

random_users.each do |user|
  activities = Activity.all.sample(rand(1..24))
  activities.each do |activity|
  unless Booking.exists?(user: user, activity: activity)
    Booking.create(
      user: user,
      activity: activity,
    )
    end
  end
end

puts "Bookings ready 🥷"

# FEEDBACKS:

# Fetch past activities (those with event_time in the past)
past_activities = Activity.where("event_time < ?", Date.today)

# Method to create feedback for users
def create_feedback_for_users(users, activities)
  activities.each do |activity|
    users.each do |user|
      next unless Booking.exists?(user: user, activity: activity)

      # Generate random appreciation (95% positive, 5% negative)
      appreciation = rand < 0.95

      # Create feedback if it doesn't already exist
      unless Feedback.exists?(user: user, activity: activity)
        Feedback.create!(
          user: user,
          activity: activity,
          appreciation: appreciation
        )
      end
    end
  end
end

create_feedback_for_users(random_users, past_activities)
create_feedback_for_users(specific_users, past_activities)

puts "Feedbacks done 🫡"

# MESSAGES:

def create_messages_for_club_feed(club, users)
  message_templates = [
    "Excited to be part of #{club.name}! The sessions here are amazing!",
    "I just love training at #{club.name}. The vibe here is unmatched.",
    "Great workout at #{club.name} on Rue #{club.address.split[1]}. See you all next time!",
    "#{club.details.split('.').first} Truly inspiring sessions.",
    "The energy at #{club.name} is incredible! Can't wait for the next session.",
    "Looking forward to our next activity! #{club.activities.first&.title || 'Training'} is always a blast.",
    "What a great community at #{club.name}! #{club.instagram_link} is a must-follow."
  ]

  club_activities = club.activities
  eligible_users = users.select do |user|
    next unless user
      club_activities.each do |activity|
        Booking.exists?(user: user, activity: activity)
      end
  end

  eligible_users.each_with_index do |user, index|
    next unless user

    # Generate a random number of messages per user
    1.times do
      # Generate a random relevant timestamp
      message_time = Faker::Time.backward(days: 30, period: :evening)

      # Generate a relevant message based on the club's category
      message_content = message_templates[index % message_templates.size]

      # Create the message
      message = Message.create!(
        user: user,
        club: club,
        content: message_content,
        created_at: message_time
      )
    end
  end

  puts "Messages created for #{club.name}."
end

# Create messages for each club
Club.all.each do |club|
  create_messages_for_club_feed(club, specific_users)
end

puts "All messages have been created!"

puts "Seeded database!"
