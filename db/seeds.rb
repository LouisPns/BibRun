# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "faker"


User.destroy_all
Race.destroy_all
Bib.destroy_all

# USERS SEED

user_list = [{
    first_name: "Nicolas",
    last_name: "Lagarde",
    email: "lagardenicolas@gmail.com",
    age: 32,
    remote_picture_url: "https://2c1fd987323fc5582413-61ddbed9f4001b199a5e9dbd18bb2c5f.ssl.cf1.rackcdn.com/709/70855_original.jpg",
    level: "sunday",
    password: "1235689"
  },
  {
    first_name: "Louis",
    last_name: "Pons",
    email: "louispons@gmail.com",
    age: 21,
    remote_picture_url: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAL5AAAAJGY2YmI5M2JhLWFhZmYtNDc3YS1hNGNmLTUxZmE0YzcxYzBjNQ.jpg",
    level: "professional",
    password: "mypswd"
  },
  {
    first_name: "Sylvain",
    last_name: "Volpeo",
    email: "volpeo@orange.net",
    age: 28,
    remote_picture_url: "http://media.senscritique.com/media/000003992117/source/volpeo.jpg",
    level: "runner",
    password: "thisismysecret"
  },
  {
    first_name: "Florent",
    last_name: "Surfer",
    email: "iamata@hotmail.com",
    age: 26,
    remote_picture_url: "http://photos4.meetupstatic.com/photos/member/4/0/5/7/highres_244396471.jpeg",
    level: "regular",
    password: "872BDUIOjsi"
  },
  {
    first_name: "Josiane",
    last_name: "Rodriguez",
    email: "rodriguez@josiane.com",
    age: 67,
    remote_picture_url: "http://img1.telestar.fr/var/telestar/storage/images/media/images/2015/photos/20150326-josiane-balasko/josiane-balasko/795875-1-fre-FR/Josiane-Balasko_max1024x768.jpg",
    level: "sunday",
    password: "ilovelewagonguys"
  }]

# RACES SEED

race_list = [
  {
    name: "Course langonnaise athletisme",
    address: "Langon",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "Trail Nature",
    distance: 16,
    remote_picture_url: "http://www.marchons.com/attachments/626_Flyer%20Ronde%20des%20Ducs%202013.jpg",
  },
  {
    name: "Le givré de la plaine de Carbon-Blanc",
    address: "Carbon-Blanc",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "FFA",
    distance: 30,
    remote_picture_url: "http://p.calameoassets.com/111117110719-c818eafda2e779598a1975b1515b86ce/p1.jpg",
  },
  {
    name: "Itsas Laminen Corrika",
    address: "Listrac-Médoc",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "No label",
    distance: 60,
    remote_picture_url: "http://www.time-chrono.fr/inscriptions/vichy/vichy.jpg",
  },
  {
    name: "Le Trail des Mouflons",
    address: "Libourne",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "FFA",
    distance: 45,
    remote_picture_url: "http://courses.nature.free.fr/wp-content/uploads/2015_03_flyer_trail_mouflons.jpg",
  },
  {
    name: "Ekiden du CA Villenave",
    address: "Villenave d'Ornon",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "Trail Nature",
    distance: 23,
    remote_picture_url: "http://3.bp.blogspot.com/-sPWLoOkVooE/VFk8iztDsjI/AAAAAAAABG8/n5be823LK-o/s1600/affiche%2Bekiden%2B2015.jpg",
  }]

puts "create reason and price table"
reason = ["disabled", "forgotten", "absent", "injured"]
price = [50, 25, 70, 55]

race_list.each do |r|
  race = Race.new(r)
  race.save
end

user_list.each do |u|
  user = User.new(u)
  user.save
end

User.first.bibs.create({price: price.sample, quantity: 1, sale_reason: reason.sample, race: Race.last})

# 10.times do |i|
#   user = User.new({
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     age: 21,
#     picture: "https://unsplash.it/200/300/?random",
#     level: "professional",
#     password: "123soleil"

#   })
#   user.save

#   race = Race.new({
#     name: "course des pins perdus #{i}",
#     address: Faker::Address.city,
#     date: Faker::Date.forward(50),
#     race_type: "marathon",
#     label: "FFA",
#     picture: "https://unsplash.it/600/300?random&gravity=center",
#   })
#   race.save

