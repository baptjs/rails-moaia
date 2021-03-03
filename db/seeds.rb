require 'json'
require 'open-uri'
require './db/photos_seeds'
require './db/species_seed'

# --------------- USERS ---------------

puts "Cleaning USERS database..."
User.destroy_all

puts "Creating users..."
User.create!(first_name: "Baptiste", last_name: "Josse", age: 29 , city: "Paris", email: "baptiste@gmail.com", password: "secret", description: "Hi, I'm Baptiste ! I love adventure and snorkeling. I'm currently in Bali, so if you cherche someone to dive, it's a pleasure ! ", avatar_url:"https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/20292681_10211935177968045_3900832542794430335_n.jpg?_nc_cat=101&ccb=3&_nc_sid=0debeb&_nc_ohc=LepZDhv_flQAX9gRpzk&_nc_ht=scontent-cdt1-1.xx&oh=bcc447badba35e3684d3e335af05e112&oe=60524335", nickname: "Baptou")
User.create!(first_name: "Thomas", last_name: "Moessner", age: 28, city: "Bordeaux", email: "thomas@gmail.com", password: "secret", description: "Hello, I'm Thomas. I'm love traveling and discoverd new diving spot. I already done a lot of spot, so if you want advise you can send me a message.", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01JASARRND-2749c28ba94d-512", nickname: "Thom")
User.create!(first_name: "Cyrielle", last_name: "Gout", age: 25, city: "Bordeaux", email: "cyrielle@gmail.com", password: "secret", description: "I'm Cyrielle, I live in France and I'm passionate of snorkeling. I am always looking for a new spot to discoverd !", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01J4HUUB6G-4bd88b49390d-512", nickname: "Cycy")
User.create!(first_name: "Alexandre", last_name: "Madeleine", age: 21, city: "Bordeaux", email: "alex@gmail.com", password: "secret", description: "Hi, I'm Alex, I love snorkeling and I love exchange about it. If you are passionate about snorkeling too, it's a pleasure to exchange.", avatar_url: "https://ca.slack-edge.com/T02NE0241-U01JD3D89CH-c479e937dfeb-512", nickname: "Alex")
User.create!(first_name: "Laura", last_name: "Clegueur", age: 21, city: "Bordeaux", email: "laura@gmail.com", password: "secret", description: "Hi, I'm Laura, I like traveling and diving.", avatar_url:"https://images.unsplash.com/photo-1605406575185-776fb76c9319?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80", nickname: "Laura")
User.create!(first_name: "Maxime", last_name: "Auger", age: 21, city: "Lyon", email: "maxime@gmail.com", password: "secret", description: "I'm Maxime, I'm here for discoverd new diving spot and for exchange about it :).", avatar_url:"https://images.unsplash.com/photo-1614537064776-45908d16d5aa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", nickname: "Max")
User.create!(first_name: "Camille", last_name: "Devigne", age: 30, city: "Marseille", email: "camille@gmail.com", password: "secret", description: "Hello everyone, I'm Camille. I'm in love with clownfish, i'm alway looking for spot where i can found this species", avatar_url:"https://images.unsplash.com/photo-1511946021155-54ce502fe9a6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1340&q=80", nickname: "Cam")
User.create!(first_name: "Laurent", last_name: "Smith", age: 30, city: "Paris", email: "laurent@gmail.com", password: "secret", description: "Hi everyone ! I alway looking for Common balloonfish, these are my favorites :).", avatar_url:"https://images.unsplash.com/photo-1568648801431-a7be13ee3a03?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80", nickname: "Laurent")

# --------------- SPOTS ---------------

puts "Cleaning SPOTS database..."
Spot.destroy_all
puts "Cleaning REVIEWS database..."
Review.destroy_all

puts "Creating spots & reviews..."

AREAS = [
  {name: "Indonesia", lat: -8.65, lng: 115.22, dist: 50},
  {name: "Egypt", lat: 27.40, lng: 33.68, dist: 50},
  {name: "Mexico", lat: 20.63, lng: -87.08, dist: 12}
]

spot_id = 0

AREAS.each do |area|
  dive_sites_url = "http://api.divesites.com/?mode=sites&lat=#{area[:lat]}&lng=#{area[:lng]}&dist=#{area[:dist]}"
  dive_sites_serialized = open(dive_sites_url).read
  dive_sites = JSON.parse(dive_sites_serialized)["sites"]
  puts "#{dive_sites.count} dive sites found near #{area[:name]}"

  dive_sites.each do |dive_site|
    spot_id += 1
    spot_name = dive_site["name"].encode('UTF-8', invalid: :replace, undef: :replace,  replace: "'" )
    spot_country = area[:name]
    spot_lat = dive_site["lat"].to_f
    spot_long = dive_site["lng"].to_f

    spot = Spot.new(name: spot_name, region: spot_country, latitude: spot_lat, longitude: spot_long, user_id: rand(1..4), description: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nesciunt, dignissimos quos magnam. Commodi corrupti nisi reprehenderit sequi, quibusdam nostrum vitae minus. Rerum, quas, nihil. Rem veniam cupiditate magni doloremque. Pariatur. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nesciunt, dignissimos quos magnam. Commodi corrupti nisi reprehenderit sequi, quibusdam nostrum vitae minus. Rerum, quas, nihil. Rem veniam cupiditate magni doloremque. Pariatur.")

    add_photos_to(spot, spot_name, spot_id)

    spot.save!
  end
end

# For demoday
tulamben = Spot.find_by(name: "Tulamben")
tulamben.description = "Tulamben is a small fishing village on the northeast coast of Bali. It's one of Bali's most popular dive sites since the wreck of the Liberty, a US Army transport vessel torpedoed by a Japanese submarine in 1942 is just offshore. If you are a novice diver this is a unique opportunity to dive a world class wreck. If you are an experienced diver, explore the deeper part of the wreck, around 35 meters, and admire the wonderful bow cannon covered in corals. Perfect for photographers! In addition, macro enthusiasts may also encounter the rare pygmy seahorse in the area."
tulamben.save!

# # --------------- REVIEWS ---------------
file = URI.open('https://i.pinimg.com/564x/a2/02/49/a202498ee42f8f99ae5fb4128e444c4a.jpg')
file1 = URI.open('https://i.pinimg.com/564x/a7/0b/d2/a70bd22e3f039e3831f1a31ec04f6074.jpg')
review = Review.create!(spot_id: 1, user_id: 1, date: Time.local(2020, 6, 11), content: "Wow, what an amazing spot !! ", rating: 5)
review.photos.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
review.photos.attach(io: file1, filename: 'nes.png', content_type: 'image/jpg')





Spot.all.each do |spot|
  number_of_packs_of_reviews = rand(1..5) # 1 'pack' = 3 reviews
  number_of_packs_of_reviews.times do
    Review.create!(spot_id: spot.id, user_id: 1, date: Time.local(2020, 6, 11), content: "Amazing spot! I saw tens of species, including turtles <3", rating: rand(1..5))
    Review.create!(spot_id: spot.id, user_id: 2, date: Time.local(2020, 12, 4), content: "Awful! A shark tried to attack me, I almost died!!! (although my friends say it was a goldfish...)", rating: rand(1..5))
    Review.create!(spot_id: spot.id, user_id: 3, date: Time.local(2021, 1, 10), content: "I recomment this spot if, like me, you looove starfishes", rating: rand(1..5))

  end
    Review.create!(spot_id: spot.id, user_id: 1, date: Time.local(2020, 6, 11), content: "Amazing spot! I saw tens of species, including turtles <3", rating: 5, tips: "Plusieurs couples de murènes sont nichés dans les rochers !! ")
    Review.create!(spot_id: spot.id, user_id: 2, date: Time.local(2020, 12, 4), content: "Awful! A shark tried to attack me, I almost died!!! (although my friends say it was a goldfish...)", rating: 1, tips: "Ya des poulpes près des falaises")
    Review.create!(spot_id: spot.id, user_id: 4, date: Time.local(2021, 1, 10), content: "I recomment this spot if, like me, you looove starfishes", rating: 4, tips: "Attention à la mouuusse !")
end

# For demoday
tulamben.reviews.destroy_all
review_tulamben = URI.open('https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/71/11/b0.jpg')
review_tulamben1 = URI.open('https://media-cdn.tripadvisor.com/media/photo-w/1a/dc/bc/90/photo0jpg.jpg')
review_tulamben2 = URI.open('https://media-cdn.tripadvisor.com/media/photo-w/1a/86/be/dd/img-20200107-wa0002-largejpg.jpg')
review_tulamben3 = URI.open('https://media-cdn.tripadvisor.com/media/photo-o/18/df/41/f2/photo5jpg.jpg')
review_tulamben4 = URI.open('https://media-cdn.tripadvisor.com/media/photo-o/18/df/41/f0/photo3jpg.jpg')
review1 = Review.create!(spot: tulamben, user_id: 1, date: Time.local(2020, 5, 12), content: "This experience remains one of the most beautiful in bali.", rating: 4)
review1.photos.attach(io: review_tulamben, filename: 'tul.png', content_type: 'image/jpg')
review1.photos.attach(io: review_tulamben1, filename: 'tul.png', content_type: 'image/jpg')
review1.photos.attach(io: review_tulamben2, filename: 'tul.png', content_type: 'image/jpg')
review1.photos.attach(io: review_tulamben3, filename: 'tul.png', content_type: 'image/jpg')
review1.photos.attach(io: review_tulamben4, filename: 'tul.png', content_type: 'image/jpg')

r1 = Review.create!(spot: tulamben, user_id: 3, date: Time.local(2020, 7, 12), content: "First dive at Liberty, everything was perfect!", rating: 5)
r2 =Review.create!(spot: tulamben, user_id: 5, date: Time.local(2020, 10, 1), content: "Very beautiful wreck covered with corals and surrounded by magnificent fish.", rating: 4, tips: "the wreckage is easily accessible and visibility is often very good.")
r3 =Review.create!(spot: tulamben, user_id: 7, date: Time.local(2020, 9, 7), content: "Pebble beach but ideal for snorkeling just a few meters from the shore. Multicolored fish, very rich flora and fauna", rating: 5)
r4 =Review.create!(spot: tulamben, user_id:2, date: Time.local(2020, 7, 1), content: "The beach is very clean, quiet and the best beach for snorkeling and diving even a bit far from the Kuta area", rating: 5, tips: "many multicolored and varied fish")
r5 =Review.create!(spot: tulamben, user_id: 4, date: Time.local(2020, 5, 11), content: "The beach is made of pebbles so you have to tread carefully on it, but it is worth it! The waves are so relaxing and if you walk to the beach there are small waves so it's easier to get into the water!", rating: 4, tips: "Proximity to wildlife is an advantage")
r6 =Review.create!(spot: tulamben, user_id: 6, date: Time.local(2020, 4, 15), content: "if you like to swim with a mask, once in the water, you can admire lots of fish, corals and even the wreck of the ship USS Liberty, 120 m long, visible from the surface, 30 m from the shore. An atypical beach!", rating: 4)
r7 =Review.create!(spot: tulamben, user_id: 8, date: Time.local(2020, 4, 20), content: "Very beautiful dives are to be done in Tulamben. Whether with a bottle or snorkeling, you will find your pleasure.", rating: 5)


# # --------------- FISHES ---------------

puts "Cleaning FISHES database..."
Fish.destroy_all

puts "Creating fish..."
add_fish()
puts "#{Fish.all.count} fish added"


# # --------------- SPOTTINGS ---------------

puts "Cleaning SPOTTINGS database..."
Spotting.destroy_all

puts "Creating spottings..."
Review.all.each do |review|
  number_of_spottings = rand(1..10)
  number_of_spottings.times do
    Spotting.create!(review_id: review.id, fish_id: rand(1..Fish.all.count), number: rand(1..100))
  end
end

# For demoday
tulamben.reviews.each do |review|
  review.spottings.destroy_all
end
Spotting.create!(fish_id: 28, review: review1)
Spotting.create!(fish_id: 16, review: review1)
Spotting.create!(fish_id: 21, review: review1)
Spotting.create!(fish_id: 93, review: review1)
Spotting.create!(fish_id: 50, review: review1)
Spotting.create!(fish_id:  6, review: review1)
Spotting.create!(fish_id: 42, review: review1)
Spotting.create!(fish_id: 33, review: review1)


# # --------------- TAGS ---------------

puts "Cleaning TAGS databases..."
DiveTypeTag.destroy_all
DifficultyTag.destroy_all
AttractionsTag.destroy_all

puts "Creating tags..."
DIVE_TYPE_TAGS = ["Boat Dive", "Shore Dive", "Night Dive", "Salt Water", "Fresh Water", "Snorkling"]
DIFFICULTY_TAGS = ["Beginner", "Intermediate", "Advanced", "Technical"]
ATTRACTIONS_TAGS = ["Caves/Mines", "Ruins", "Wrecks", "Walls", "Natural Reefs", "Artificial Reefs", "Fishing"]
DIVE_TYPE_TAGS.each { |tag| DiveTypeTag.create!(name: tag)}
DIFFICULTY_TAGS.each { |tag| DifficultyTag.create!(name: tag)}
ATTRACTIONS_TAGS.each { |tag| AttractionsTag.create!(name: tag)}



# # --------------- TAGGINGS ---------------

puts "Cleaning TAGGINGS databases..."
DiveTypeTagging.destroy_all
DifficultyTagging.destroy_all
AttractionsTagging.destroy_all

puts "Creating taggings..."
Spot.all.each do |spot|

  # Type of dive
  dive_type_tags_ids = DiveTypeTag.all.map { |tag| tag.id } # to ensure that there won't be the same tag twice for a given spot
  number_of_dive_type_tags = rand(0..3) # number of tags to be created for this spot
  number_of_dive_type_tags.times do
    tag_id = dive_type_tags_ids[rand(0..dive_type_tags_ids.count - 1)]
    dive_type_tags_ids.delete(tag_id)
    DiveTypeTagging.create!(spot_id: spot.id, dive_type_tag_id: tag_id)
  end

  # Difficulty
  difficulty_tags_ids = DifficultyTag.all.map { |tag| tag.id }
  tag_id = difficulty_tags_ids[rand(0..difficulty_tags_ids.count - 1)]
  DifficultyTagging.create!(spot_id: spot.id, difficulty_tag_id: tag_id)

  # Attractions
  attractions_tags_ids = AttractionsTag.all.map { |tag| tag.id }
  tag_id = attractions_tags_ids[rand(0..attractions_tags_ids.count - 1)]
  AttractionsTagging.create!(spot_id: spot.id, attractions_tag_id: tag_id)

end


tulamben.dive_type_taggings.destroy_all
tulamben.difficulty_taggings.destroy_all
tulamben.attractions_taggings.destroy_all
DiveTypeTagging.create!(dive_type_tag_id: 4, spot: tulamben)
DiveTypeTagging.create!(dive_type_tag_id: 2, spot: tulamben)
DiveTypeTagging.create!(dive_type_tag_id: 6, spot: tulamben)
DifficultyTagging.create!(difficulty_tag_id: 2, spot: tulamben)
AttractionsTagging.create!(attractions_tag_id: 3, spot: tulamben)




# # --------------- MESSAGES ---------------

puts "Cleaning MESSAGE databases..."
Conversation.destroy_all

puts "Creating conversations..."
Conversation.create!(name: "Conversation with Cyrielle")

puts "Creating messages..."
Message.create!(content: "salut", user_id: 2, conversation_id: 1)
Message.create!(content: "ça va ?", user_id: 3, conversation_id: 1)


puts "Done ! :)"
puts "Don't forget to db:drop, db:create, db:migrate, db:seed ! ;)"



