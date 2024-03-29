User.destroy_all
Event.destroy_all
Checkin.destroy_all
Comment.destroy_all
puts "Seeds have been disintegrated 💥"
puts "Generating new seeds 🌱"

# Users section -- START --
users = []

users << {
  first_name: "Raecine", last_name: "Leaddev",
  username: "rae", email: "rae@mpulse.com", gender: "2",
  photo: {
    io: File.open(Rails.root.join('db/images/raecine.jpg')),
    filename: 'raecine.jpg'
  }
}

users << {
  first_name: "Meg", last_name: "Projman",
  username: "komegi", email: "meg@mpulse.com", gender: "2",
  photo: {
    io: File.open(Rails.root.join('db/images/megumi.jpg')),
    filename: 'megumi.jpg'
  }
}

users << {
  first_name: "Syrene", last_name: "Prontendo",
  username: "syrene", email: "sy@mpulse.com", gender: "1",
  photo: {
    io: File.open(Rails.root.join('db/images/syrene.jpg')),
    filename: 'syrene.jpg'
  }
}

users << {
  first_name: "Justin", last_name: "Bakuendo",
  username: "just", email: "justin@mpulse.com", gender: "1",
  photo: {
    io: File.open(Rails.root.join('db/images/justin.jpg')),
    filename: 'justin.jpg'
  }
}

admin_users = []

users.each do |user|
  created_user = User.create!(
    first_name: user[:first_name], last_name: user[:last_name],
    username: user[:username], email: user[:email],
    gender: user[:gender], password: "123456"
  )
  created_user.photo.attach(user[:photo])
  admin_users << created_user

  if created_user.gender == 1
    puts "User -> #{created_user.username} has been created... 🚹"
  elsif created_user.gender == 2
    puts "User -> #{created_user.username} has been created... 🚺"
  else
    puts "User -> #{created_user.username} has been created... 🦄"
  end
end

# Random users for checkins!
random_users = []
number = 1 # For incrementing
# rando_usernames = ["PartyAnimal", "MochaScript", "qt.pi", "1337coder", "unicorn", "LakersFan"]

print "Creating random users"

60.times do
  created_user = User.create!(
    first_name: "RandomFirstName#{number}", last_name: "RandomLastName#{number}",
    username: "#{Faker::Internet.username(specifier: 5..8)}#{number}",
    email: "RandomEmail#{number}@mpulse.com", gender: rand(1..2),
    password: "123456"
  )
  created_user.photo.attach(
    io: URI.open(Faker::Avatar.image(slug: created_user.username.to_s, size: "50x50", format: "jpg")),
    filename: "#{created_user.username}.jpg"
  )
  random_users << created_user
  number += 1
  print "."
end

puts ""
puts "Created #{random_users.count} random users 🤖"

puts "All users have been generated succesfully 💃🕺"
# Users section -- END --

# Events section -- START --
# Add your own TODAY's event here ⬇️
events = [
  { name: "le wagon MEGA Demo Day",
    description: "Join us for our MEGA Demo Day in Tokyo, introducing 16 final projects from both our web development and data science bootcamps 🔥",
    address: "Ebisu", category: 3,
    start_at: DateTime.new(2024, 3, 8, 18, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 22, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/demo.jpg')),
        filename: 'demo.jpg' },
      { io: File.open(Rails.root.join('db/images/demo2.jpg')),
        filename: 'demo2.jpg' }
    ] }, # OK / RED
  { name: "Disco Ball 🪩",
    description: "Party until your head spin 😵‍💫",
    address: "Shinjuku", category: 0,
    start_at: DateTime.new(2024, 3, 8, 21, 0, 0),
    end_at: DateTime.new(2024, 3, 9, 4, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/discoball.jpg')),
        filename: 'discoball.jpg' },
      { io: File.open(Rails.root.join('db/images/discoball2.jpg')),
        filename: 'discoball2.jpg' },
      { io: File.open(Rails.root.join('db/images/discoball3.jpg')),
        filename: 'discoball3.jpg' }
    ] }, # OK / RED
    { name: "Yamathon 🚃",
      description: "Walk the 30 stations, the 45km (wow!!) of the mythic Yamanote line together, from Mejiro to Mejiro!🏃‍♂️🏃‍♀️",
      address: "Mejiro", category: 1,
      start_at: DateTime.new(2024, 3, 8, 9, 0, 0),
      end_at: DateTime.new(2024, 3, 8, 23, 0, 0),
      photos: [
        { io: File.open(Rails.root.join('db/images/yamathon.jpg')),
          filename: 'yamathon.jpg' },
        { io: File.open(Rails.root.join('db/images/yamathon_2.jpg')),
          filename: 'yamathon_2.jpg' },
        { io: File.open(Rails.root.join('db/images/yamathon_3.jpg')),
          filename: 'yamathon_3.jpg' }
      ] }, # OK / RED
  { name: "70's Night 📺",
    description: "Go back in time and bring your vintage look to life",
    address: "Shibuya", category: 0,
    start_at: DateTime.new(2024, 3, 8, 20, 0, 0),
    end_at: DateTime.new(2024, 3, 9, 22, 30, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/70s.jpg')),
        filename: '70s.jpg' },
      { io: File.open(Rails.root.join('db/images/70s2.jpg')),
        filename: '70s2.jpg' },
      { io: File.open(Rails.root.join('db/images/70s3.jpg')),
        filename: '70s3.jpg' }
    ] }, # OK / RED
  { name: "Single's Meet-up 💘",
    description: "Find your match made in heaven in this meet-up event. Disclaimer: You are not required to end up with a partner by the end of this event!",
    address: "Ikebukuro", category: 2,
    start_at: DateTime.new(2024, 3, 8, 20, 30, 0),
    end_at: DateTime.new(2024, 3, 9, 2, 30, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/singles.jpg')),
        filename: 'singles.jpg' },
      { io: File.open(Rails.root.join('db/images/singles2.jpg')),
        filename: 'singles2.jpg' },
      { io: File.open(Rails.root.join('db/images/singles3.jpg')),
        filename: 'singles3.jpg' }
    ] }, # NG
  { name: "Pre-sakura Half-Marathon 🏃",
    description: "Warm-up before the Sakura season start, join us in this fun run along the scenic Meguro river",
    address: "Nakameguro", category: 1,
    start_at: DateTime.new(2024, 3, 8, 9, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 14, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/marathon.jpg')),
        filename: 'marathon.jpg' },
      { io: File.open(Rails.root.join('db/images/marathon2.jpg')),
        filename: 'marathon2.jpg' },
      { io: File.open(Rails.root.join('db/images/marathon3.jpg')),
        filename: 'marathon3.jpg' }
    ] }, # OK / ORANGE
  { name: "InnovateX Conference💻",
    description: "Join us at the InnovateX Conference, where visionaries, thought leaders, and innovators converge to explore the cutting-edge trends",
    address: "Roppongi", category: 3,
    start_at: DateTime.new(2024, 3, 8, 13, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 18, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/InnovateX Conference_2.jpg')),
        filename: 'InnovateX Conference_2.jpg' },
      { io: File.open(Rails.root.join('db/images/InnovateX Conference.jpg')),
        filename: 'InnovateX Conference.jpg' },
      { io: File.open(Rails.root.join('db/images/InnovateX Conference_3.jpg')),
        filename: 'InnovateX Conference_3.jpg' }
    ] }, # OK / ORANGE
  { name: "Morning Yoga🧘",
    description: "Start your day fresh with yoga in Yoyogi Park!",
    address: "Yoyogi", category: 1,
    start_at: DateTime.new(2024, 3, 8, 9, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 11, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/yoga_1.jpg')),
        filename: 'yoga_1.jpg' },
      { io: File.open(Rails.root.join('db/images/yoga_2.jpg')),
        filename: 'yoga_2.jpg' },
      { io: File.open(Rails.root.join('db/images/yoga_3.jpg')),
        filename: 'yoga_3.jpg' }
  ] }, # OK / ORANGE
  { name: "Midnight Madness Club Party🎉",
    description: "Join us for a night of non-stop fun, music, and excitement as we transform the dance floor into an electrifying playground of rhythm and beats.",
    address: "Kabukicho", category: 0,
    start_at: DateTime.new(2024, 3, 8, 22, 0, 0),
    end_at: DateTime.new(2024, 3, 9, 4, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/Midnight Madness.jpg')),
        filename: 'Midnight Madness.jpg' },
      { io: File.open(Rails.root.join('db/images/Midnight Madness_2.jpg')),
        filename: 'Midnight Madness_2.jpg' },
      { io: File.open(Rails.root.join('db/images/Midnight Madness_3.jpg')),
        filename: 'Midnight Madness_3.jpg' }
    ] }, # OK / ORANGE
  { name: "Film Fanatics Forum🎬",
    description: "Welcome to the Film Fanatics Forum, where movie lovers unite for a cinematic celebration like no other!",
    address: "Nakano", category: 2,
    start_at: DateTime.new(2024, 3, 8, 14, 0, 0),
    end_at: DateTime.new(2024, 3, 9, 20, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/Film Fanatics.jpg')),
        filename: 'Film Fanatics.jpg' },
      { io: File.open(Rails.root.join('db/images/Film Fanatics_2.jpg')),
        filename: 'Film Fanatics_2.jpg' },
      { io: File.open(Rails.root.join('db/images/Film Fanatics_3.jpg')),
        filename: 'Film Fanatics_3.jpg' }
    ] }, # NG
  { name: "Japan vs England match ⚽️",
    description: "Welcome to the Film Fanatics Forum, where movie lovers unite for a cinematic celebration like no other!",
    address: "Sendagaya", category: 1,
    start_at: DateTime.new(2024, 3, 8, 18, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 22, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/japanvsengland.jpg')),
        filename: 'japanvsengland.jpg' },
      { io: File.open(Rails.root.join('db/images/japanvsengland_2.jpg')),
        filename: 'japanvsengland_2.jpg' },
      { io: File.open(Rails.root.join('db/images/japanvsengland_3.jpg')),
        filename: 'japanvsengland_3.jpg' }
    ] }, # OK / ORANGE
  { name: "Health Tech Conference🩺",
    description: "Welcome to the HealthTech Innovate Summit, where pioneers, innovators, and thought leaders converge to explore the cutting-edge advancements.",
    address: "Akihabara", category: 3,
    start_at: DateTime.new(2024, 3, 8, 10, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 17, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/health.jpg')),
        filename: 'health.jpg' },
      { io: File.open(Rails.root.join('db/images/health_2.jpeg')),
        filename: 'health_2.jpeg' },
      { io: File.open(Rails.root.join('db/images/health_2.jpeg')),
        filename: 'health_3.jpeg' }
    ] }, # OK / ORANGE
  { name: "Kpop night🇰🇷",
    description: "Welcome to the K-Pop Krazed Meetup, where fans of Korean pop music come together to celebrate their love for K-pop culture!",
    address: "Tokyo Dome", category: 2,
    start_at: DateTime.new(2024, 3, 8, 18, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 22, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/kpop.jpg')),
        filename: 'kpop.jpg' },
      { io: File.open(Rails.root.join('db/images/kpop_2.jpg')),
        filename: 'kpop_2.jpg' },
      { io: File.open(Rails.root.join('db/images/kpop_3.jpg')),
        filename: 'kpop_3.jpg' }
    ] }, # OK / BLUE
  { name: "Strawberry Festival🍓",
    description: "Join us for a day filled with fun, food, and festivities as we celebrate the vibrant and delicious strawberry harvest.",
    address: "Jiyugaoka", category: 2,
    start_at: DateTime.new(2024, 3, 8, 11, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 19, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/strawberry.jpg')),
        filename: 'strawberry.jpg' },
      { io: File.open(Rails.root.join('db/images/strawberry_2.jpg')),
        filename: 'strawberry_2.jpg' },
      { io: File.open(Rails.root.join('db/images/strawberry_3.jpg')),
        filename: 'strawberry_3.jpg' }
    ] }, # OK / BLUE
  { name: "A City Pop Celebration🎸",
    description: "Get ready to immerse yourself in the smooth sounds and nostalgic vibes of City Pop at the City Groove event!",
    address: "Shimokitazawa", category: 0,
    start_at: DateTime.new(2024, 3, 8, 21, 0, 0),
    end_at: DateTime.new(2024, 3, 9, 4, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/citypop.jpg')),
        filename: 'citypop.jpg' },
      { io: File.open(Rails.root.join('db/images/citypop_2.jpg')),
        filename: 'citypop_2.jpg' },
      { io: File.open(Rails.root.join('db/images/citypop_3.jpeg')),
        filename: 'citypop_3.jpeg' }
    ] }, # OK / BLUE
  { name: "Sakura Matsuri🌸🇯🇵",
    description: "Step into a world of beauty, tradition, and wonder at Sakura Matsuri, a vibrant celebration of Japanese culture.",
    address: "Hamamatsucho", category: 2,
    start_at: DateTime.new(2024, 3, 8, 12, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 18, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/sakuramatsuri.jpg')),
        filename: 'sakuramatsuri.jpg' },
      { io: File.open(Rails.root.join('db/images/sakuramatsuri_2.jpg')),
        filename: 'sakuramatsuri_2.jpg' },
      { io: File.open(Rails.root.join('db/images/sakuramatsuri_3.jpg')),
        filename: 'sakuramatsuri_3.jpg' }
    ] }, # OK / BLUE
  { name: "Spring Fes🌱",
    description: "Celebrate the arrival of spring in all its glory at Spring Fes, a vibrant festival filled with lively performances, and joyful festivities.",
    address: "Odaiba", category: 2,
    start_at: DateTime.new(2024, 3, 8, 9, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 17, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/sakuramatsuri.jpg')),
        filename: 'sakuramatsuri.jpg' },
      { io: File.open(Rails.root.join('db/images/sakuramatsuri_2.jpg')),
        filename: 'sakuramatsuri_2.jpg' },
      { io: File.open(Rails.root.join('db/images/sakuramatsuri_3.jpg')),
        filename: 'sakuramatsuri_3.jpg' }
    ] }, # OK / BLUE
  { name: "The Athletic Challenge🚴",
    description: "Join us for an electrifying journey through a series of grueling challenges that will push your mind, body, and spirit to the limit.",
    address: "Shinagawa", category: 1,
    start_at: DateTime.new(2024, 3, 8, 9, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 18, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/shinagawa_fes.jpg')),
        filename: 'shinagawa_fes.jpg' },
      { io: File.open(Rails.root.join('db/images/shinagawa_fes_2.jpg')),
        filename: 'shinagawa_fes_2.jpg' },
      { io: File.open(Rails.root.join('db/images/shinagawa_fes_3.jpg')),
        filename: 'shinagawa_fes_3.jpg' }
    ] }, # OK / BLUE
  { name: "Innovator Spark📱",
    description: "Join us for a day of immersive learning, networking, and empowerment as we navigate the exciting world of startups and innovation.",
    address: "Gotanda", category: 3,
    start_at: DateTime.new(2024, 3, 8, 11, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 20, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/entrepreneur.jpg')),
        filename: 'entrepreneur.jpg' },
      { io: File.open(Rails.root.join('db/images/entrepreneur_2.jpg')),
        filename: 'entrepreneur.jpg' },
      { io: File.open(Rails.root.join('db/images/entrepreneur_3.jpg')),
        filename: 'entrepreneur.jpg' }
    ] }, # OK / BLUE
  { name: "Lazona Wagashi Festival🍡",
    description: "The festival serves as a platform for both locals and tourists to immerse themselves in the beauty and flavors of wagashi.",
    address: "Yokohama", category: 2,
    start_at: DateTime.new(2024, 3, 8, 10, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 20, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/wagashi.jpg')),
        filename: 'wagashi.jpg' },
      { io: File.open(Rails.root.join('db/images/wagashi_2.jpg')),
        filename: 'wagashi_2.jpg' },
      { io: File.open(Rails.root.join('db/images/wagashi_3.jpg')),
        filename: 'wagashi_3.jpg' }
    ] }, # NG
  { name: "Pokémon Search🔍",
    description: "Pokémon Search invites Pokémon enthusiasts of all ages to embark on an exciting adventure through the bustling streets of Ikebukuro.",
    address: "Takadanobaba", category: 2,
    start_at: DateTime.new(2024, 3, 8, 10, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 20, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/pokemon.png')),
        filename: 'pokemon.jpg' },
      { io: File.open(Rails.root.join('db/images/pokemon_2.jpg')),
        filename: 'pokemon_2.jpg' },
      { io: File.open(Rails.root.join('db/images/pokemon_3.jpg')),
        filename: 'pokemon_3.jpg' }
    ] }, # OK / BLUE
  { name: "Homerun Derby⚾️",
    description: "This thrilling baseball event promises a home run experience for fans of all ages",
    address: "Chofu", category: 1,
    start_at: DateTime.new(2024, 3, 8, 10, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 15, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/homerun.jpg')),
        filename: 'homerun.jpg' },
      { io: File.open(Rails.root.join('db/images/homerun_2.jpg')),
        filename: 'homerun_2.jpg' },
      { io: File.open(Rails.root.join('db/images/homerun_3.jpg')),
        filename: 'homerun_3.jpg' }
    ] }, # NG
  { name: "Wine Symphony🍷",
    description: "Set in an elegant venue adorned with twinkling lights and classical music softly playing in the background.",
    address: "Mitaka", category: 2,
    start_at: DateTime.new(2024, 3, 8, 16, 0, 0),
    end_at: DateTime.new(2024, 3, 8, 22, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/wine.jpg')),
        filename: 'wine.jpg' },
      { io: File.open(Rails.root.join('db/images/wine_2.jpg')),
        filename: 'wine_2.jpg' },
      { io: File.open(Rails.root.join('db/images/wine_3.jpg')),
        filename: 'wine_3.jpg' }
    ] } # NG
] # Current event categories: 0-Club, 1-Sports, 2-Meet-up, 3-Tech

finished_events = [
  { name: "New Years Rave!",
    description: "Start the year with a BANG! 💣",
    address: "Shibuya", category: 2,
    start_at: DateTime.new(2024, 1, 5, 21, 30, 0),
    end_at: DateTime.new(2024, 1, 6, 5, 30, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/new_year.jpg')),
        filename: 'new_year.jpg' }
    ] },
  { name: "Web Development Seminar 💻",
    description: "Create your first web application while learning front and back end development",
    address: "Meguro", category: 3,
    start_at: DateTime.new(2024, 2, 14, 19, 0, 0),
    end_at: DateTime.new(2024, 2, 14, 20, 30, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/programming.jpg')),
        filename: 'programming.jpg' }
    ] },
  { name: "Era's Tour After Party",
    description: "Swifties Unite! 💁‍♀️",
    address: "Tokyo Dome", category: 2,
    start_at: DateTime.new(2024, 2, 9, 22, 0, 0),
    end_at: DateTime.new(2024, 2, 9, 23, 30, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/eras.jpg')),
        filename: 'eras.jpg' }
    ] },
  { name: "Level up your coding skills and build a game with JavaScript🎮",
    description: "Let's deep dive into the world of Javascript!",
    address: "Nihonbashi", category: 3,
    start_at: DateTime.new(2024, 1, 16, 19, 0, 0),
    end_at: DateTime.new(2024, 2, 9, 22, 0, 0),
    photos: [
      { io: File.open(Rails.root.join('db/images/javascript.jpg')),
        filename: 'javascript.jpg' }
    ] }
]

# DateTime format guide: DateTime.new(2001,2,3,4,5,6)
# Result => <DateTime: 2001-02-03T04:05:06+00:00 ...>

# Time randomizer ### Currently not used to favor specific times
# start_times = []

# 5.times do
#   month = 3 # Month is set to march
#   day = 8 # Random day set to 8th
#   hour = rand(10..19) # Random time between 10am and 7pm

#   start_times << DateTime.new(2024, month, day, hour, 30, 0)
# end

main_events = []
events.each do |event|
  # starting_time = start_times.sample
  # Random datetime instance with set parameters from start_times array
  e = Event.create!( # uncomment for seeding images feature
    name: event[:name],
    description: event[:description],
    address: event[:address],
    category: event[:category],
    start_at: event[:start_at],
    end_at: event[:end_at],
    user: admin_users.sample
    # Assigned to random organizer/admin user
  )
  c = 1
  puts "Attaching photos to #{e.name} "
  event[:photos].each do |photo|
    e.photos.attach(photo)
    print "Photo no. #{c} attached, "
    c += 1
  end
  main_events << e
  puts "Event -> #{e.name} has been created"
end

puts "#{main_events.count} current events generated 🤹"

past_events = []
puts "Generating past events 📼"
finished_events.each do |event|
  e = Event.create!( # uncomment for seeding images feature
    name: event[:name],
    description: event[:description],
    address: event[:address],
    category: event[:category],
    start_at: event[:start_at],
    end_at: event[:end_at],
    user: admin_users.sample
    # Assigned to random organizer/admin user
  )
  event[:photos].each do |photo|
    e.photos.attach(photo)
  end
  past_events << e
  print "#{e.name} created, "
end

puts ""
puts "#{past_events.count} past events has been created 🦖"

puts "Events have been generated succesfully 🪩🎊🪅"
# Events section -- END --

# Checkins/Comments section -- START --
random_users.each do |user|
  c = 1
  main_events.each do |event|
    if c <= 5
      go = rand(1..8)
      if go != 1
        Checkin.create!( status: 1, event: event, user: user)
      end
    elsif c <= 12
      go = rand(1..2)
      if go != 1
        Checkin.create!( status: 1, event: event, user: user)
      end
    else
      go = rand(1..8)
      if go == 1
        Checkin.create!( status: 1, event: event, user: user)
      end
    end
    c += 1
  end
end

past_events.each do |event|
  Checkin.create!(status: 2, event: event, user: admin_users[0])
end

puts "Checkins have been generated succesfully ☑️"
# Checkins section -- END --

# Comments section -- START --
commenters = []
number = rand(3..25)

5.times do
  commenters << random_users[number]
  number += rand(2..5)
end

Event.all.each do |event|
  Comment.create!(
    event: event, user: commenters[0],
    content: "Best event ever!"
  )
  Comment.create!(
    event: event, user: commenters[1],
    content: "Why isn't this event everyday?"
  )
  Comment.create!(
    event: event, user: commenters[2],
    content: "Happiest day of my life 🥳"
  )
  Comment.create!(
    event: event, user: commenters[3],
    content: "Pretty cool event 😎"
  )
  Comment.create!(
    event: event, user: commenters[4],
    content: "Nice!"
  )
end

puts "Random user comments have been posted 📢"
# Comments section -- END --
