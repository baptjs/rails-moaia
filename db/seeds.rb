
# require 'json'
# require 'open-uri'

# # # --------------- USERS ---------------

# puts "Cleaning USERS database..."
# User.destroy_all

# puts "Creating users..."
# User.create!(first_name: "Baptiste", last_name: "Josse", age: 29, city: "Paris", email: "baptiste@gmail.com", password: "secret", description: "Salut moi c'est Baptiste, j'aime l'aventure et le code !! Je peux devenir ton ami contre une petite compensation financière :) A pluusss ! " ,avatar_url:"https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/20292681_10211935177968045_3900832542794430335_n.jpg?_nc_cat=101&ccb=3&_nc_sid=0debeb&_nc_ohc=LepZDhv_flQAX9gRpzk&_nc_ht=scontent-cdt1-1.xx&oh=bcc447badba35e3684d3e335af05e112&oe=60524335", nickname: "Baptou")
# User.create!(first_name: "Thomas", last_name: "Moessner", age: 28, city: "Bordeaux", email: "thomas@gmail.com", password: "secret", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01JASARRND-2749c28ba94d-512", nickname: "Thom")
# User.create!(first_name: "Cyrielle", last_name: "Gout", age: 25, city: "Bordeaux", email: "cyrielle@gmail.com", password: "secret", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01J4HUUB6G-4bd88b49390d-512", nickname: "Cycy")
# User.create!(first_name: "Alexandre", last_name: "Madeleine", age: 21, city: "Bordeaux", email: "alex@gmail.com", password: "secret",description: "Salut, je suis un type plutôt cool, viens me rencontrer", avatar_url: "https://ca.slack-edge.com/T02NE0241-U01JD3D89CH-c479e937dfeb-512", nickname: "Alex")

# # --------------- SPOTS (& nested REVIEWS) ---------------

# puts "Cleaning SPOTS database..."
# Spot.destroy_all
# puts "Cleaning REVIEWS database..."
# Review.destroy_all

# puts "Creating spots & reviews..."

# AREAS = [
#   {name: "Bali", lat: -8.65, lng: 115.22, dist: 30},
#   {}
# ]
# dive_sites_url = "http://api.divesites.com/?mode=sites&lat=47.6031537682643&lng=-122.336164712906&dist=250000"
# dive_sites_serialized = open(dive_sites_url).read
# dive_sites = JSON.parse(dive_sites_serialized)["sites"]
# puts "#{dive_sites.count} dive sites found"

# spot_id = 0
# AREAS.each do |area|




#   spot_id += 1
#   spot_name = dive_site["name"].encode('UTF-8', invalid: :replace, undef: :replace,  replace: "'" )
#   spot_lat = dive_site["lat"].to_f
#   spot_long = dive_site["lng"].to_f

#   spot = Spot.create!(name: spot_name, latitude: spot_lat, longitude: spot_long, user_id: rand(1..4), description: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nesciunt, dignissimos quos magnam. Commodi corrupti nisi reprehenderit sequi, quibusdam nostrum vitae minus. Rerum, quas, nihil. Rem veniam cupiditate magni doloremque. Pariatur. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nesciunt, dignissimos quos magnam. Commodi corrupti nisi reprehenderit sequi, quibusdam nostrum vitae minus. Rerum, quas, nihil. Rem veniam cupiditate magni doloremque. Pariatur.")
#   Review.create!(spot_id: spot_id, user_id: 1, date: Time.local(2020, 6, 11), content: "Amazing spot! I saw tens of species, including turtles <3", rating: 5, tips: "Breathe")
#   Review.create!(spot_id: spot_id, user_id: 2, date: Time.local(2020, 12, 4), content: "Awful! A shark tried to attack me, I almost died!!! (although my friends say it was a goldfish...)", rating: 1, tips: "Don't go")
#   Review.create!(spot_id: spot_id, user_id: 3, date: Time.local(2021, 1, 10), content: "I recomment this spot if, like me, you looove starfishes", rating: 4, tips: "Look at the starfishes")
# end

# tulamben = Spot.find_by(name: "Tulamben")
# puts "Attaching photos to Tulamben spot (id: #{tulamben.id})"
# tulamben1 = URI.open('https://www.balireefdivers.com/sites/default/files/styles/epsa-page-pic/public/pagepics/MSD_print_02%281%29.jpg?itok=yQilg0er')
# tulamben2 = URI.open('http://www.evolutiondiver.com/images/images_plongees/solo_4_site_de_plongee_diver_site_kubu_boga_epave_wreck.jpg')
# tulamben3 = URI.open('https://www.atlantis-bali-diving.com/wp-content/uploads/2020/06/Tulamben-Diving-Atlantis-Bali-Diving.jpg')
# tulamben.photos.attach(io: tulamben1, filename:'tulamben1.jpeg')
# tulamben.photos.attach(io: tulamben2, filename:'tulamben2.jpeg')
# tulamben.photos.attach(io: tulamben3, filename:'tulamben2.jpeg')

# # Idem pour "Manta point", "Nusa Lembongan", "Crystal Bay"...?

# # # --------------- FISHES ---------------

# puts "Cleaning FISHES database..."
# Fish.destroy_all

# puts "Creating fishes..."
# species_url = "https://www.fishwatch.gov/api/species"
# species_serialized = open(species_url).read
# species = JSON.parse(species_serialized)
# puts "#{species.count} fishes found"

# species.each do |specie|
#   Fish.create!(name: specie["Species Name"], photo_url: specie["Species Illustration Photo"]['src'])
# end

# # # --------------- SPOTTINGS ---------------

# puts "Cleaning SPOTTINGS database..."
# Spotting.destroy_all

# puts "Creating spottings..."
# Review.all.each do |review|
#   number_of_spottings = rand(1..10)
#   number_of_spottings.times do
#     Spotting.create!(review_id: review.id, fish_id: rand(1..113), number: rand(1..100))
#   end
# end


# puts "Done ! :)"
# puts "Don't forget to db:drop, db:create, db:migrate, db:seed ! ;)"