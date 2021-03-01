def add_photos_to(spot, spot_name, spot_id)
  case spot_name

  # # --------------- INDONESIA ---------------

  when "Tulamben"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    tulamben1 = URI.open('https://www.balireefdivers.com/sites/default/files/styles/epsa-page-pic/public/pagepics/MSD_print_02%281%29.jpg?itok=yQilg0er')
    tulamben2 = URI.open('http://www.evolutiondiver.com/images/images_plongees/solo_4_site_de_plongee_diver_site_kubu_boga_epave_wreck.jpg')
    tulamben3 = URI.open('https://www.atlantis-bali-diving.com/wp-content/uploads/2020/06/Tulamben-Diving-Atlantis-Bali-Diving.jpg')
    spot.photos.attach(io: tulamben1, filename:'tulamben1.jpeg')
    spot.photos.attach(io: tulamben2, filename:'tulamben2.jpeg')
    spot.photos.attach(io: tulamben3, filename:'tulamben2.jpeg')

  when "Nusa Lembongan"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    nusa_lembongan1 = URI.open('https://images.pexels.com/photos/3723505/pexels-photo-3723505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: nusa_lembongan1, filename:'nusa_lembongan1.jpeg')

  when "Manta point"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    manta_point1 = URI.open('https://images.pexels.com/photos/5222290/pexels-photo-5222290.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: manta_point1, filename:'manta_point1.jpeg')

  when "Crystal Bay"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    crystal_bay1 = URI.open('https://images.pexels.com/photos/3805131/pexels-photo-3805131.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: crystal_bay1, filename:'crytal_bay1.jpeg')

  when "Toyapakeh"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    toyapakeh1 = URI.open('https://images.pexels.com/photos/3098969/pexels-photo-3098969.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: toyapakeh1, filename:'toyapakeh1.jpeg')

  when "Ferry Channel"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    ferry_channel1 = URI.open('https://images.pexels.com/photos/4696248/pexels-photo-4696248.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: ferry_channel1, filename:'ferry_channel1.jpeg')

  when "Mimpang Bali"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    mimpang_bali1 = URI.open('https://images.pexels.com/photos/4006758/pexels-photo-4006758.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: mimpang_bali1, filename:'mimpang_bali1.jpeg')

  when "Gili Mimpang"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    gili_mimpang1 = URI.open('https://images.pexels.com/photos/4205045/pexels-photo-4205045.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
    spot.photos.attach(io: gili_mimpang1, filename:'gili_mimpang1.jpeg')

  when "Bunutan Amed"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    bunutan_amed1 = URI.open('https://cdn.pixabay.com/photo/2017/09/27/09/54/anemone-2791565_1280.jpg')
    spot.photos.attach(io: bunutan_amed1, filename:'bunutan_amed1.jpeg')

  when "Gili Tepekong"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    gili_tepekong1 = URI.open('https://cdn.pixabay.com/photo/2013/09/23/22/33/turtle-185484_1280.jpg')
    spot.photos.attach(io: gili_tepekong1, filename:'gili_tepekong1.jpeg')

  when "USAT Liberty"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    usat_liberty1 = URI.open('https://cdn.pixabay.com/photo/2016/01/19/14/57/seaplane-1149100_1280.jpg')
    spot.photos.attach(io: usat_liberty1, filename:'usat_liberty1.jpeg')


  # # --------------- EGYPT ---------------

  when "Susana Wreck"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    susana_wreck1 = URI.open('https://cdn.pixabay.com/photo/2020/06/17/17/01/underwater-5310424_1280.jpg')
    spot.photos.attach(io: susana_wreck1, filename:'susana_wreck1.jpeg')


  when "Haggadah - RedSea"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    haggadah_redsea1 = URI.open('https://cdn.pixabay.com/photo/2016/09/09/08/58/wreck-1656519_1280.jpg')
    spot.photos.attach(io: haggadah_redsea1, filename:'haggadah_redsea1.jpeg')

  when "Giannis D"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    giannis_d1 = URI.open('https://cdn.pixabay.com/photo/2016/09/09/08/58/wreck-1656519_1280.jpg')
    spot.photos.attach(io: giannis_d1, filename:'giannis_d1.jpeg')

  when "Abu Nuhas Reef"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    abu_nuhas_reef1 = URI.open('https://cdn.pixabay.com/photo/2015/04/08/12/53/underwater-712631_1280.jpg')
    spot.photos.attach(io: abu_nuhas_reef1, filename:'abu_nuhas_reef1.jpeg')

  when "P&O Carnatic"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    p_o_carnatic1 = URI.open('https://cdn.pixabay.com/photo/2014/09/19/10/13/coral-452010_1280.jpg')
    spot.photos.attach(io: p_o_carnatic1, filename:'p_o_carnatic1.jpeg')

  when "T43 minesweeper (Elmina)"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    t43_minesweeper_elmina1 = URI.open('https://cdn.pixabay.com/photo/2015/10/06/13/13/diving-974385_1280.jpg')
    spot.photos.attach(io: t43_minesweeper_elmina1, filename:'t43_minesweeper_elmina1.jpeg')

  when "Kimon M"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    kimon_m1 = URI.open('https://cdn.pixabay.com/photo/2014/06/27/12/36/fish-378286_1280.jpg')
    spot.photos.attach(io: kimon_m1, filename:'kimon_m1.jpeg')

  when "The Barge"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    the_barge1 = URI.open('https://images.pexels.com/photos/3721304/pexels-photo-3721304.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: the_barge1, filename:'the_barge1.jpeg')

  when "Shab Sabrina"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    shab_sabrina1 = URI.open('https://cdn.pixabay.com/photo/2020/04/11/09/47/turtle-5029662_1280.jpg')
    spot.photos.attach(io: shab_sabrina1, filename:'shab_sabrina1.jpeg')

  when "Abu Ramada"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    abu_ramada1 = URI.open('https://media.istockphoto.com/photos/female-scuba-diver-picture-id471906851?k=6&m=471906851&s=612x612&w=0&h=-AZY2hu4uCOafeo9pUsuucsERdXvui_jPgiWfl7SvJE=')
    spot.photos.attach(io: abu_ramada1, filename:'abu_ramada1.jpeg')

  when "Ras Disha"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    ras_disha1 = URI.open('https://media.istockphoto.com/photos/wreck-rozi-picture-id543196968?k=6&m=543196968&s=612x612&w=0&h=yG6L0cu-iWHxprBok3cSVTsB7ZeLJr9TZmlmUKRdw2A=')
    spot.photos.attach(io: ras_disha1, filename:'ras_disha1.jpeg')

  when "Abu Hashish"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    abu_hashish1 = URI.open('https://images.pexels.com/photos/4628401/pexels-photo-4628401.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: abu_hashish1, filename:'abu_hashish1.jpeg')

  when "Rad Mohamed"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    rad_mohamed1 = URI.open('https://cdn.pixabay.com/photo/2014/11/28/22/40/diver-549369_1280.jpg')
    spot.photos.attach(io: rad_mohamed1, filename:'rad_mohamed1.jpeg')

  when "Shark Observatory"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    shark_observatory1 = URI.open('https://cdn.pixabay.com/photo/2015/03/16/15/40/hai-676167_1280.jpg')
    spot.photos.attach(io: shark_observatory1, filename:'shark_observatory1.jpeg')

  when "Gamul Soraya"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    gamul_soraya1 = URI.open('https://cdn.pixabay.com/photo/2016/06/02/04/27/lionfish-1430225_1280.jpg')
    spot.photos.attach(io: gamul_soraya1, filename:'gamul_soraya1.jpeg')

  when "Chrisoula K"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    chrisoula_k1 = URI.open('https://images.pexels.com/photos/5398759/pexels-photo-5398759.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: chrisoula_k1, filename:'chrisoula_k1.jpeg')

  when "Thistlegorm"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    thistlegorm1 = URI.open('https://images.pexels.com/photos/4603276/pexels-photo-4603276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: thistlegorm1, filename:'thistlegorm1.jpeg')

  # # --------------- MEXICO ---------------

  when "Jardines Reef"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    jardines_reef1 = URI.open('https://cdn.pixabay.com/photo/2014/06/27/12/36/fish-378286_1280.jpg')
    spot.photos.attach(io: jardines_reef1, filename:'jardines_reef1.jpeg')

  when "Barracuda"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    barracuda1 = URI.open('https://media.istockphoto.com/photos/wreck-rozi-picture-id543196968?k=6&m=543196968&s=612x612&w=0&h=yG6L0cu-iWHxprBok3cSVTsB7ZeLJr9TZmlmUKRdw2A=')
    spot.photos.attach(io: barracuda1, filename:'barracuda1.jpeg')

  when "Jardines"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    jardines1 = URI.open('https://cdn.pixabay.com/photo/2014/08/26/23/28/octopus-428745_1280.jpg')
    spot.photos.attach(io: jardines1, filename:'jardines1.jpeg')

  when "Tortugas"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    tortugas1 = URI.open('https://images.pexels.com/photos/5289881/pexels-photo-5289881.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: tortugas1, filename:'tortugas1.jpeg')

  when "Playa Del Carmen"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    playa_del_carmen1 = URI.open('https://cdn.pixabay.com/photo/2013/12/09/03/44/squid-225423_1280.jpg')
    spot.photos.attach(io: playa_del_carmen1, filename:'playa_del_carmen1.jpeg')

  when "Chikin Ha Cenote"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    chikin_ha_cenote1 = URI.open('https://images.pexels.com/photos/6702830/pexels-photo-6702830.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
    spot.photos.attach(io: chikin_ha_cenote1, filename:'chikin_ha_cenote1.jpeg')

  when "Paamul Deep"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    paamul_deep1 = URI.open('https://images.pexels.com/photos/5289882/pexels-photo-5289882.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
    spot.photos.attach(io: paamul_deep1, filename:'paamul_deep1.jpeg')

  when "Paamul"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    paamul1 = URI.open('https://images.pexels.com/photos/4628402/pexels-photo-4628402.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
    spot.photos.attach(io: paamul1, filename:'paamul1.jpeg')

  when "San Juan Reef"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    san_juan_reef1 = URI.open('https://images.pexels.com/photos/3990830/pexels-photo-3990830.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
    spot.photos.attach(io: san_juan_reef1, filename:'san_juan_reef1.jpeg')

  when "Scuba Club Cozumel"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    scuba_club_cozumel1 = URI.open('https://images.pexels.com/photos/6858231/pexels-photo-6858231.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: scuba_club_cozumel1, filename:'scuba_club_cozumel1.jpeg')

  when "Blue Angel Resort"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    blue_angel_resort1 = URI.open('https://images.pexels.com/photos/5061256/pexels-photo-5061256.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    spot.photos.attach(io: blue_angel_resort1, filename:'blue_angel_resort1.jpeg')

  when "Baracuda Reef"
  puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
  baracuda_reef1 = URI.open('https://images.pexels.com/photos/4050930/pexels-photo-4050930.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
  spot.photos.attach(io: baracuda_reef1, filename:'baracuda_reef1.jpeg')

  when "Cozumel"
    puts "Attaching photos to #{spot_name} spot (id: #{spot_id})"
    cozumel1 = URI.open('https://images.pexels.com/photos/4006759/pexels-photo-4006759.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
    spot.photos.attach(io: cozumel1, filename:'cozumel1.jpeg')
  end
end


