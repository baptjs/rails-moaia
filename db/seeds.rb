# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'




# puts "Cleaning database..."
# User.destroy_all

# puts "Creating users..."
# User.create!(first_name: "Baptiste", last_name: "Josse", nickname: "Bapt78", age: 29, email: "baptiste@gmail.com", password: "secret", description: "Salut moi c'est Baptiste, j'aime l'aventure et le code !! Je peux devenir ton ami contre une petite compensation financière :) A pluusss ! ", avatar_url: "https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/20292681_10211935177968045_3900832542794430335_n.jpg?_nc_cat=101&ccb=3&_nc_sid=0debeb&_nc_ohc=LepZDhv_flQAX9gRpzk&_nc_ht=scontent-cdt1-1.xx&oh=bcc447badba35e3684d3e335af05e112&oe=60524335")
# User.create!(first_name: "Thomas", last_name: "Moessner", nickname: "ThomasMoe", age: 28, email: "totodu33@gmail.com", password: "secret", description: "Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01JASARRND-2749c28ba94d-512")
# User.create!(first_name: "Cyrielle", last_name: "Gout", nickname: "Cyrielle33", age: 25, email: "cyrielle@gmail.com", password: "secret", description: "Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01J4HUUB6G-4bd88b49390d-512")
# User.create!(first_name: "Alexandre", last_name: "Madeleine", nickname: "Alex90", age: 21, email: "alex@gmail.com", password: "secret",description: "Salut, je suis un type plutôt cool, viens me rencontrer", avatar_url: "https://ca.slack-edge.com/T02NE0241-U01JD3D89CH-c479e937dfeb-512")

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


