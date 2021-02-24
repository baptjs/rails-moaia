# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "open-uri"

# User.create!(nickname: "Billy", email:"billy@gmail.com", password:"secret")

Spot.destroy_all
file1 = URI.open('https://images.pexels.com/photos/2404365/pexels-photo-2404365.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
file2 = URI.open('https://images.pexels.com/photos/3046582/pexels-photo-3046582.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
spot = Spot.create!(name: 'Spot1', latitude: 12, longitude: 23, description: "blabla", user_id: 1)
spot.photos.attach(io: file1, filename: 'photo1.jpg', content_type: 'image/jpg')
spot.photos.attach(io: file2, filename: 'photo2.jpg', content_type: 'image/jpg')

