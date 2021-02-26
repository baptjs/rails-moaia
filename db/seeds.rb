require 'json'
require 'open-uri'

# # --------------- USERS ---------------

puts "Cleaning USERS database..."
User.destroy_all

puts "Creating users..."
User.create!(first_name: "Baptiste", last_name: "Josse", age: 29, city: "Paris", email: "baptiste@gmail.com", password: "secret", description: "Salut moi c'est Baptiste, j'aime l'aventure et le code !! Je peux devenir ton ami contre une petite compensation financière :) A pluusss ! " ,avatar_url:"https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/20292681_10211935177968045_3900832542794430335_n.jpg?_nc_cat=101&ccb=3&_nc_sid=0debeb&_nc_ohc=LepZDhv_flQAX9gRpzk&_nc_ht=scontent-cdt1-1.xx&oh=bcc447badba35e3684d3e335af05e112&oe=60524335", nickname: "Baptou")
User.create!(first_name: "Thomas", last_name: "Moessner", age: 28, city: "Bordeaux", email: "thomas@gmail.com", password: "secret", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01JASARRND-2749c28ba94d-512", nickname: "Thom")
User.create!(first_name: "Cyrielle", last_name: "Gout", age: 25, city: "Bordeaux", email: "cyrielle@gmail.com", password: "secret", avatar_url:"https://ca.slack-edge.com/T02NE0241-U01J4HUUB6G-4bd88b49390d-512", nickname: "Cycy")
User.create!(first_name: "Alexandre", last_name: "Madeleine", age: 21, city: "Bordeaux", email: "alex@gmail.com", password: "secret",description: "Salut, je suis un type plutôt cool, viens me rencontrer", avatar_url: "https://ca.slack-edge.com/T02NE0241-U01JD3D89CH-c479e937dfeb-512", nickname: "Alex")

# --------------- SPOTS (& nested REVIEWS) ---------------

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

    spot = Spot.create!(name: spot_name, country: spot_country, latitude: spot_lat, longitude: spot_long, user_id: rand(1..4), description: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nesciunt, dignissimos quos magnam. Commodi corrupti nisi reprehenderit sequi, quibusdam nostrum vitae minus. Rerum, quas, nihil. Rem veniam cupiditate magni doloremque. Pariatur. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nesciunt, dignissimos quos magnam. Commodi corrupti nisi reprehenderit sequi, quibusdam nostrum vitae minus. Rerum, quas, nihil. Rem veniam cupiditate magni doloremque. Pariatur.")

    number_of_packs_of_reviews = rand(1..10) # 1 'pack' = 3 reviews
    number_of_packs_of_reviews.times do
      Review.create!(spot_id: spot_id, user_id: 1, date: Time.local(2020, 6, 11), content: "Amazing spot! I saw tens of species, including turtles <3", rating: rand(1..5))
      Review.create!(spot_id: spot_id, user_id: 2, date: Time.local(2020, 12, 4), content: "Awful! A shark tried to attack me, I almost died!!! (although my friends say it was a goldfish...)", rating: rand(1..5))
      Review.create!(spot_id: spot_id, user_id: 3, date: Time.local(2021, 1, 10), content: "I recomment this spot if, like me, you looove starfishes", rating: rand(1..5))
    end
  end
end
# # --------------- BALI ---------------
tulamben = Spot.find_by(name: "Tulamben")
puts "Attaching photos to Tulamben spot (id: #{tulamben.id})"
tulamben1 = URI.open('https://www.balireefdivers.com/sites/default/files/styles/epsa-page-pic/public/pagepics/MSD_print_02%281%29.jpg?itok=yQilg0er')
tulamben2 = URI.open('http://www.evolutiondiver.com/images/images_plongees/solo_4_site_de_plongee_diver_site_kubu_boga_epave_wreck.jpg')
tulamben3 = URI.open('https://www.atlantis-bali-diving.com/wp-content/uploads/2020/06/Tulamben-Diving-Atlantis-Bali-Diving.jpg')
tulamben.photos.attach(io: tulamben1, filename:'tulamben1.jpeg')
tulamben.photos.attach(io: tulamben2, filename:'tulamben2.jpeg')
tulamben.photos.attach(io: tulamben3, filename:'tulamben2.jpeg')

nusa_lembongan = Spot.find_by(name: "Nusa Lembongan")
puts "Attaching photos to Tulamben spot (id: #{nusa_lembongan.id})"
nusa_lembongan1 = URI.open('https://images.pexels.com/photos/3723505/pexels-photo-3723505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
nusa_lembongan.photos.attach(io: nusa_lembongan1, filename:'nusa_lembongan1.jpeg')

manta_point = Spot.find_by(name: "Manta point")
puts "Attaching photos to Tulamben spot (id: #{manta_point.id})"
manta_point1 = URI.open('https://images.pexels.com/photos/5222290/pexels-photo-5222290.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
manta_point.photos.attach(io: manta_point1, filename:'manta_point1.jpeg')

crystal_bay = Spot.find_by(name: "Crystal Bay")
puts "Attaching photos to Tulamben spot (id: #{crystal_bay.id})"
crystal_bay1 = URI.open('https://images.pexels.com/photos/3805131/pexels-photo-3805131.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
crystal_bay.photos.attach(io: crystal_bay1, filename:'crytal_bay1.jpeg')

toyapakeh = Spot.find_by(name: "Toyapakeh")
puts "Attaching photos to Tulamben spot (id: #{toyapakeh.id})"
toyapakeh1 = URI.open('https://images.pexels.com/photos/3098969/pexels-photo-3098969.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
toyapakeh.photos.attach(io: toyapakeh1, filename:'toyapakeh1.jpeg')

ferry_channel = Spot.find_by(name: "Ferry Channel")
puts "Attaching photos to Tulamben spot (id: #{ferry_channel.id})"
ferry_channel1 = URI.open('https://images.pexels.com/photos/4696248/pexels-photo-4696248.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
ferry_channel.photos.attach(io: ferry_channel1, filename:'ferry_channel1.jpeg')

mimpang_bali = Spot.find_by(name: "Mimpang Bali")
puts "Attaching photos to Tulamben spot (id: #{mimpang_bali.id})"
mimpang_bali1 = URI.open('https://images.pexels.com/photos/4006758/pexels-photo-4006758.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
mimpang_bali.photos.attach(io: mimpang_bali1, filename:'mimpang_bali1.jpeg')

gili_mimpang = Spot.find_by(name: "Gili Mimpang")
puts "Attaching photos to Tulamben spot (id: #{gili_mimpang.id})"
gili_mimpang1 = URI.open('https://images.pexels.com/photos/4205045/pexels-photo-4205045.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
gili_mimpang.photos.attach(io: gili_mimpang1, filename:'gili_mimpang1.jpeg')

bunutan_amed = Spot.find_by(name: "Bunutan Amed")
puts "Attaching photos to Tulamben spot (id: #{bunutan_amed.id})"
bunutan_amed1 = URI.open('https://cdn.pixabay.com/photo/2017/09/27/09/54/anemone-2791565_1280.jpg')
bunutan_amed.photos.attach(io: bunutan_amed1, filename:'bunutan_amed1.jpeg')

gili_tepekong = Spot.find_by(name: "Gili Tepekong")
puts "Attaching photos to Tulamben spot (id: #{gili_tepekong.id})"
gili_tepekong1 = URI.open('https://cdn.pixabay.com/photo/2013/09/23/22/33/turtle-185484_1280.jpg')
gili_tepekong.photos.attach(io: gili_tepekong1, filename:'gili_tepekong1.jpeg')

usat_liberty = Spot.find_by(name: "USAT Liberty")
puts "Attaching photos to Tulamben spot (id: #{usat_liberty.id})"
usat_liberty1 = URI.open('https://cdn.pixabay.com/photo/2016/01/19/14/57/seaplane-1149100_1280.jpg')
usat_liberty.photos.attach(io: usat_liberty1, filename:'usat_liberty1.jpeg')


# # --------------- EGYPTE ---------------
susana_wreck = Spot.find_by(name: "Susana Wreck")
puts "Attaching photos to Tulamben spot (id: #{susana_wreck.id})"
susana_wreck1 = URI.open('https://cdn.pixabay.com/photo/2020/06/17/17/01/underwater-5310424_1280.jpg')
susana_wreck.photos.attach(io: susana_wreck1, filename:'susana_wreck1.jpeg')


haggadah_redsea = Spot.find_by(name: "Haggadah - RedSea")
puts "Attaching photos to Tulamben spot (id: #{haggadah_redsea.id})"
haggadah_redsea1 = URI.open('https://cdn.pixabay.com/photo/2016/09/09/08/58/wreck-1656519_1280.jpg')
haggadah_redsea.photos.attach(io: haggadah_redsea1, filename:'haggadah_redsea1.jpeg')

giannis_d = Spot.find_by(name: "Giannis D")
puts "Attaching photos to Tulamben spot (id: #{giannis_d.id})"
giannis_d1 = URI.open('https://cdn.pixabay.com/photo/2016/09/09/08/58/wreck-1656519_1280.jpg')
giannis_d.photos.attach(io: giannis_d1, filename:'giannis_d1.jpeg')

abu_nuhas_reef = Spot.find_by(name: "Abu Nuhas Reef")
puts "Attaching photos to Tulamben spot (id: #{abu_nuhas_reef.id})"
abu_nuhas_reef1 = URI.open('https://cdn.pixabay.com/photo/2015/04/08/12/53/underwater-712631_1280.jpg')
abu_nuhas_reef.photos.attach(io: abu_nuhas_reef1, filename:'abu_nuhas_reef1.jpeg')

p_o_carnatic = Spot.find_by(name: "P&O Carnatic")
puts "Attaching photos to Tulamben spot (id: #{p_o_carnatic.id})"
p_o_carnatic1 = URI.open('https://cdn.pixabay.com/photo/2014/09/19/10/13/coral-452010_1280.jpg')
p_o_carnatic.photos.attach(io: p_o_carnatic1, filename:'p_o_carnatic1.jpeg')

t43_minesweeper_elmina = Spot.find_by(name: "T43 minesweeper (Elmina)")
puts "Attaching photos to Tulamben spot (id: #{t43_minesweeper_elmina.id})"
t43_minesweeper_elmina1 = URI.open('https://cdn.pixabay.com/photo/2015/10/06/13/13/diving-974385_1280.jpg')
t43_minesweeper_elmina.photos.attach(io: t43_minesweeper_elmina1, filename:'t43_minesweeper_elmina1.jpeg')

kimon_m = Spot.find_by(name: "Kimon M")
puts "Attaching photos to Tulamben spot (id: #{kimon_m.id})"
kimon_m1 = URI.open('https://cdn.pixabay.com/photo/2014/06/27/12/36/fish-378286_1280.jpg')
kimon_m.photos.attach(io: kimon_m1, filename:'kimon_m1.jpeg')

the_barge = Spot.find_by(name: "The Barge")
puts "Attaching photos to Tulamben spot (id: #{the_barge.id})"
the_barge1 = URI.open('https://images.pexels.com/photos/3721304/pexels-photo-3721304.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
the_barge.photos.attach(io: the_barge1, filename:'the_barge1.jpeg')

shab_sabrina = Spot.find_by(name: "Shab Sabrina")
puts "Attaching photos to Tulamben spot (id: #{shab_sabrina.id})"
shab_sabrina1 = URI.open('https://cdn.pixabay.com/photo/2020/04/11/09/47/turtle-5029662_1280.jpg')
shab_sabrina.photos.attach(io: shab_sabrina1, filename:'shab_sabrina1.jpeg')

abu_ramada = Spot.find_by(name: "Abu Ramada")
puts "Attaching photos to Tulamben spot (id: #{abu_ramada.id})"
abu_ramada1 = URI.open('https://media.istockphoto.com/photos/female-scuba-diver-picture-id471906851?k=6&m=471906851&s=612x612&w=0&h=-AZY2hu4uCOafeo9pUsuucsERdXvui_jPgiWfl7SvJE=')
abu_ramada.photos.attach(io: abu_ramada1, filename:'abu_ramada1.jpeg')

ras_disha = Spot.find_by(name: "Ras Disha")
puts "Attaching photos to Tulamben spot (id: #{ras_disha.id})"
ras_disha1 = URI.open('https://media.istockphoto.com/photos/wreck-rozi-picture-id543196968?k=6&m=543196968&s=612x612&w=0&h=yG6L0cu-iWHxprBok3cSVTsB7ZeLJr9TZmlmUKRdw2A=')
ras_disha.photos.attach(io: ras_disha1, filename:'ras_disha1.jpeg')

abu_hashish = Spot.find_by(name: "Abu Hashish")
puts "Attaching photos to Tulamben spot (id: #{abu_hashish.id})"
abu_hashish1 = URI.open('https://images.pexels.com/photos/4628401/pexels-photo-4628401.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
abu_hashish.photos.attach(io: abu_hashish1, filename:'abu_hashish1.jpeg')

rad_mohamed = Spot.find_by(name: "Rad Mohamed")
puts "Attaching photos to Tulamben spot (id: #{rad_mohamed.id})"
rad_mohamed1 = URI.open('https://cdn.pixabay.com/photo/2014/11/28/22/40/diver-549369_1280.jpg')
rad_mohamed.photos.attach(io: rad_mohamed1, filename:'rad_mohamed1.jpeg')

shark_observatory = Spot.find_by(name: "Shark Observatory")
puts "Attaching photos to Tulamben spot (id: #{shark_observatory.id})"
shark_observatory1 = URI.open('https://cdn.pixabay.com/photo/2015/03/16/15/40/hai-676167_1280.jpg')
shark_observatory.photos.attach(io: shark_observatory1, filename:'shark_observatory1.jpeg')

gamul_soraya = Spot.find_by(name: "Gamul Soraya")
puts "Attaching photos to Tulamben spot (id: #{gamul_soraya.id})"
gamul_soraya1 = URI.open('https://cdn.pixabay.com/photo/2016/06/02/04/27/lionfish-1430225_1280.jpg')
gamul_soraya.photos.attach(io: gamul_soraya1, filename:'gamul_soraya1.jpeg')

chrisoula_k = Spot.find_by(name: "Chrisoula K")
puts "Attaching photos to Tulamben spot (id: #{chrisoula_k.id})"
chrisoula_k1 = URI.open('https://images.pexels.com/photos/5398759/pexels-photo-5398759.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
chrisoula_k.photos.attach(io: chrisoula_k1, filename:'chrisoula_k1.jpeg')

thistlegorm = Spot.find_by(name: "Thistlegorm")
puts "Attaching photos to Tulamben spot (id: #{thistlegorm.id})"
thistlegorm1 = URI.open('https://images.pexels.com/photos/4603276/pexels-photo-4603276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
thistlegorm.photos.attach(io: thistlegorm1, filename:'thistlegorm1.jpeg')
# # --------------- MEXICO ---------------

jardines_reef = Spot.find_by(name: "Jardines Reef")
puts "Attaching photos to Tulamben spot (id: #{jardines_reef.id})"
jardines_reef1 = URI.open('https://cdn.pixabay.com/photo/2014/06/27/12/36/fish-378286_1280.jpg')
jardines_reef.photos.attach(io: jardines_reef1, filename:'jardines_reef1.jpeg')

barracuda = Spot.find_by(name: "Barracuda")
puts "Attaching photos to Tulamben spot (id: #{barracuda.id})"
barracuda1 = URI.open('https://media.istockphoto.com/photos/wreck-rozi-picture-id543196968?k=6&m=543196968&s=612x612&w=0&h=yG6L0cu-iWHxprBok3cSVTsB7ZeLJr9TZmlmUKRdw2A=')
barracuda.photos.attach(io: barracuda1, filename:'barracuda1.jpeg')

jardines = Spot.find_by(name: "Jardines")
puts "Attaching photos to Tulamben spot (id: #{jardines.id})"
jardines1 = URI.open('https://cdn.pixabay.com/photo/2014/08/26/23/28/octopus-428745_1280.jpg')
jardines.photos.attach(io: jardines1, filename:'jardines1.jpeg')

tortugas = Spot.find_by(name: "Tortugas")
puts "Attaching photos to Tulamben spot (id: #{tortugas.id})"
tortugas1 = URI.open('https://images.pexels.com/photos/5289881/pexels-photo-5289881.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
tortugas.photos.attach(io: tortugas1, filename:'tortugas1.jpeg')

playa_del_carmen = Spot.find_by(name: "Playa Del Carmen")
puts "Attaching photos to Tulamben spot (id: #{playa_del_carmen.id})"
playa_del_carmen1 = URI.open('https://cdn.pixabay.com/photo/2013/12/09/03/44/squid-225423_1280.jpg')
playa_del_carmen.photos.attach(io: playa_del_carmen1, filename:'playa_del_carmen1.jpeg')

Chikin_ha_cenote = Spot.find_by(name: "Chikin Ha Cenote")
puts "Attaching photos to Tulamben spot (id: #{Chikin_ha_cenote.id})"
Chikin_ha_cenote1 = URI.open('https://images.pexels.com/photos/6702830/pexels-photo-6702830.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
Chikin_ha_cenote.photos.attach(io: Chikin_ha_cenote1, filename:'Chikin_ha_cenote1.jpeg')

paamul_deep = Spot.find_by(name: "Paamul Deep")
puts "Attaching photos to Tulamben spot (id: #{paamul_deep.id})"
paamul_deep1 = URI.open('https://images.pexels.com/photos/5289882/pexels-photo-5289882.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
paamul_deep.photos.attach(io: paamul_deep1, filename:'paamul_deep1.jpeg')

paamul = Spot.find_by(name: "Paamul")
puts "Attaching photos to Tulamben spot (id: #{paamul.id})"
paamul1 = URI.open('https://images.pexels.com/photos/4628402/pexels-photo-4628402.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
paamul.photos.attach(io: paamul1, filename:'paamul1.jpeg')

san_juan_reef = Spot.find_by(name: "San Juan Reef")
puts "Attaching photos to Tulamben spot (id: #{san_juan_reef.id})"
san_juan_reef1 = URI.open('https://images.pexels.com/photos/3990830/pexels-photo-3990830.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
san_juan_reef.photos.attach(io: san_juan_reef1, filename:'san_juan_reef1.jpeg')

scuba_club_cozumel = Spot.find_by(name: "Scuba Club Cozumel")
puts "Attaching photos to Tulamben spot (id: #{scuba_club_cozumel.id})"
scuba_club_cozumel1 = URI.open('https://images.pexels.com/photos/6858231/pexels-photo-6858231.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
scuba_club_cozumel.photos.attach(io: scuba_club_cozumel1, filename:'scuba_club_cozumel1.jpeg')

blue_angel_resort = Spot.find_by(name: "Blue Angel Resort")
puts "Attaching photos to Tulamben spot (id: #{blue_angel_resort.id})"
blue_angel_resort1 = URI.open('https://images.pexels.com/photos/5061256/pexels-photo-5061256.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
blue_angel_resort.photos.attach(io: blue_angel_resort1, filename:'blue_angel_resort1.jpeg')

baracuda_reef = Spot.find_by(name: "Baracuda Reef")
puts "Attaching photos to Tulamben spot (id: #{baracuda_reef.id})"
baracuda_reef1 = URI.open('https://images.pexels.com/photos/4050930/pexels-photo-4050930.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
baracuda_reef.photos.attach(io: baracuda_reef1, filename:'baracuda_reef1.jpeg')

cozumel = Spot.find_by(name: "Cozumel")
puts "Attaching photos to Tulamben spot (id: #{cozumel.id})"
cozumel1 = URI.open('https://images.pexels.com/photos/4006759/pexels-photo-4006759.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
cozumel.photos.attach(io: cozumel1, filename:'cozumel1.jpeg')
# Idem pour "Manta point", "Nusa Lembongan", "Crystal Bay"...?

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

puts "Cleaning TAGS database..."
Tag.destroy_all

puts "Creating tags..."
TAGS = ["Boat Dive", "Shore Dive", "Night Dive", "Salt Water", "Fresh Water", "Snorkling", "Beginner", "Intermediate", "Advanced", "Technical", "Caves/Mines", "Ruins", "Wrecks", "Walls", "Natural Reefs", "Artificial Reefs", "Fishing"]
TAGS.each { |tag| Tag.create!(name: tag)}

# # --------------- SPOT_TAGS ---------------

puts "Cleaning SPOT_TAGS database..."
SpotTag.destroy_all

puts "Creating spot_tags..."
Spot.all.each do |spot|
  type_tags_ids = Tag.first(6).map { |tag| tag.id } # to ensure that there won't be the same tag twice for a given spot
  difficulty_tags_ids = Tag.all[6,4].map { |tag| tag.id }
  attractions_tags_ids = Tag.all[10,7].map { |tag| tag.id }
  number_of_type_tags = rand(0..3) # number of tags to be created for this spot

  # Type of dive
  number_of_type_tags.times do
    tag_id = type_tags_ids[rand(0..type_tags_ids.count - 1)]
    type_tags_ids.delete(tag_id)
    SpotTag.create!(spot_id: spot.id, tag_id: tag_id)
  end

  # Difficulty
  tag_id = difficulty_tags_ids[rand(0..difficulty_tags_ids.count - 1)]
  SpotTag.create!(spot_id: spot.id, tag_id: tag_id)

  # Attractions
  tag_id = attractions_tags_ids[rand(0..attractions_tags_ids.count - 1)]
  SpotTag.create!(spot_id: spot.id, tag_id: tag_id)

end


puts "Done ! :)"
puts "Don't forget to db:drop, db:create, db:migrate, db:seed ! ;)"

