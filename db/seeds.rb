require 'json'
require 'open-uri'
require './db/photos_seeds'

# # --------------- USERS ---------------

puts "Cleaning USERS database..."
User.destroy_all

puts "Creating users..."
User.create!(first_name: "Baptiste", last_name: "Josse", age: 29 , city: "Paris", email: "baptiste@gmail.com", password: "secret", description: "Salut moi c'est Baptiste, j'aime l'aventure et le code !! Je peux devenir ton ami contre une petite compensation financière :) A pluusss ! ", avatar_url:"https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/20292681_10211935177968045_3900832542794430335_n.jpg?_nc_cat=101&ccb=3&_nc_sid=0debeb&_nc_ohc=LepZDhv_flQAX9gRpzk&_nc_ht=scontent-cdt1-1.xx&oh=bcc447badba35e3684d3e335af05e112&oe=60524335", nickname: "Baptou")
User.create!(first_name: "Thomas", last_name: "Moessner", age: 28, city: "Bordeaux", email: "thomas@gmail.com", password: "secret", description: "Hello, moi c'est Thomas ! Je suis passionné de voyage et des plongé. Je vous partage mes tips !", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01JASARRND-2749c28ba94d-512", nickname: "Thom")
User.create!(first_name: "Cyrielle", last_name: "Gout", age: 25, city: "Bordeaux", email: "cyrielle@gmail.com", password: "secret", description: "Je m’appelle Cyrielle, j’ai 25 ans, originaire de Bordeaux. Je suis passionnée de plonger depuis longtemps, j'aime partager mes spots et les espèces que je rencontre dans les fonds marins.", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01J4HUUB6G-4bd88b49390d-512", nickname: "Cycy")
User.create!(first_name: "Alexandre", last_name: "Madeleine", age: 21, city: "Bordeaux", email: "alex@gmail.com", password: "secret", description: "Salut, je suis un type plutôt cool, viens me rencontrer", avatar_url: "https://ca.slack-edge.com/T02NE0241-U01JD3D89CH-c479e937dfeb-512", nickname: "Alex")

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


# # --------------- FISHES ---------------

puts "Cleaning FISHES database..."
Fish.destroy_all

puts "Creating fishes..."
species_url = "https://www.fishwatch.gov/api/species"
species_serialized = open(species_url).read
species = JSON.parse(species_serialized)

species_in_db = []
species.each do |specie|
  next if species_in_db.include? specie["Species Name"]
  species_in_db << specie["Species Name"]
  Fish.create!(name: specie["Species Name"], photo_url: specie["Species Illustration Photo"]['src'])
end
puts "#{species_in_db.count} fishes found"

# # --------------- SPOTTINGS ---------------

puts "Cleaning SPOTTINGS database..."
Spotting.destroy_all

puts "Creating spottings..."
Review.all.each do |review|
  number_of_spottings = rand(1..10)
  number_of_spottings.times do
    Spotting.create!(review_id: review.id, fish_id: rand(1..species_in_db.count), number: rand(1..100))
  end
end

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

puts "Creating conversations..."
Conversation.create!(name: "Conversation with Baptiste")
Conversation.create!(name: "Conversation with Cyrielle")

puts "Creating messages..."
Message.create!(content: "salut", user_id: 1, conversation_id: 1)
Message.create!(content: "ça va ?", user_id: 2, conversation_id: 1)
Message.create!(content: "salut", user_id: 2, conversation_id: 2)
Message.create!(content: "ça va ?", user_id: 3, conversation_id: 2)


puts "Done ! :)"
puts "Don't forget to db:drop, db:create, db:migrate, db:seed ! ;)"



