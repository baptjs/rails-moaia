
require 'json'
require 'open-uri'

puts "destroy spots"
Spot.destroy_all
puts "destroy des users"
User.destroy_all
puts "Creating users..."


user_1 = User.create!(first_name: "Baptiste", last_name: "Josse", age: 29, city: "Bordeaux", email: "baptiste@gmail.com", password: "secret", description: "Salut moi c'est Baptiste, j'aime l'aventure et le code !! Je peux devenir ton ami contre une petite compensation financière :) A pluusss ! " ,avatar_url:"https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/20292681_10211935177968045_3900832542794430335_n.jpg?_nc_cat=101&ccb=3&_nc_sid=0debeb&_nc_ohc=LepZDhv_flQAX9gRpzk&_nc_ht=scontent-cdt1-1.xx&oh=bcc447badba35e3684d3e335af05e112&oe=60524335", nickname: "Baptou")
user_2 = User.create!(first_name: "Thomas", last_name: "Moessner", age: 28, city: "Paris", email: "thomas@gmail.com", password: "secret", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01JASARRND-2749c28ba94d-512", nickname: "Thom")
user_3 = User.create!(first_name: "Cyrielle", last_name: "Gout", age: 25, city: "Lyon", email: "cyrielle@gmail.com", password: "secret", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01J4HUUB6G-4bd88b49390d-512", nickname: "Cycy")
user_4 = User.create!(first_name: "Alexandre", last_name: "Madeleine", age: 21, city: "Marseille", email: "alex@gmail.com", password: "secret",description: "Salut, je suis un type plutôt cool, viens me rencontrer", avatar_url: "https://ca.slack-edge.com/T02NE0241-U01JD3D89CH-c479e937dfeb-512", nickname: "Alex")


puts "Creating spots..."
file = URI.open('https://subocea.com/uploads/media/default/0001/05/fe95bd48c535ca34168f1abb9bf71f3631e0d623.jpeg')
file2 = URI.open('https://c6bo-plongee-blog.fr/wp-content/uploads/2019/04/mer-rouge-plongeurs-retour-egypte-c6bo-voyage-blog-plongee-couv.jpg')
spot_1 = Spot.new(name: "Pemuteran", latitude: -8.132946072696015, longitude: 115.3738184530749, description: "very cool spot", user: user_1 )
spot_2 = Spot.new(name: "Coco", latitude: -8.332946072696015, longitude: 115.4738184530749, description: "nice spot", user: user_2 )

spot_1.photos.attach(io: file, filename:'file.jpeg')
spot_2.photos.attach(io: file2, filename:'file.jpeg')

spot_1.save!
spot_2.save!

  puts "Cleaning Fish database..."
  Fish.destroy_all

  species_url = "https://www.fishwatch.gov/api/species"
  species_serialized = open(species_url).read
  species = JSON.parse(species_serialized)


  species.each do |specie|
    Fish.create!(name: specie["Species Name"])
    Fish.create!(photo_url: specie["Species Illustration Photo"]['src'])
  end

  # ALL_SPECIES = species["Species Name"]

puts "Finish ! :)"


