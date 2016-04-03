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
    email: "lagarde@gmail.com",
    age: 32,
    remote_picture_url: "https://2c1fd987323fc5582413-61ddbed9f4001b199a5e9dbd18bb2c5f.ssl.cf1.rackcdn.com/709/70855_original.jpg",
    level: "sunday",
    password: "123soleil"
  },
  {
    first_name: "Louis",
    last_name: "Pons",
    email: "pons@gmail.com",
    age: 21,
    remote_picture_url: "",
    level: "professional",
    password: "123soleil"
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
    email: "surfer@hotmail.com",
    age: 26,
    remote_picture_url: "http://photos4.meetupstatic.com/photos/member/4/0/5/7/highres_244396471.jpeg",
    level: "regular",
    password: "123soleil"
  },
  {
    first_name: "Samy",
    last_name: "Gonzalez",
    email: "samy@run.com",
    age: 29,
    remote_picture_url: "http://runners.fr/wp-content/uploads/2015/09/Runner2_1.jpg",
    level: "sunday",
    password: "123soleil"
  }]

# RACES SEED

race_list = [
  {
    name: "Marathon de Bordeaux ",
    address: "Bordeaux",
    date: DateTime.now + 6,
    race_type: Race::CATEGORIES.sample,
    label: "marathon",
    race_distance: 42,
    remote_picture_url: "http://www.marathondebordeauxmetropole.com/typo3temp/_processed_/csm_Visuel_web_01_8afaa42208.jpg",
  },

  {
    name: "Course langonnaise athletisme",
    address: "Langon",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "Trail Nature",
    race_distance: 16,
    remote_picture_url: "http://www.marchons.com/attachments/626_Flyer%20Ronde%20des%20Ducs%202013.jpg",
  },
  {
    name: "Le marathon du Medoc",
    address: "Pauliac",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "FFA",
    race_distance: 30,
    remote_picture_url: "http://www.marathons.fr/IMG/arton118.png?1431712857",
  },
  {
    name: "Le Trail des Mouflons",
    address: "Libourne",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "FFA",
    race_distance: 45,
    remote_picture_url: "http://courses.nature.free.fr/wp-content/uploads/2015_03_flyer_trail_mouflons.jpg",
  },
  {
    name: "10km des quais",
    address: "Bordeaux",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "bitume",
    race_distance: 10,
    remote_picture_url: "http://3.bp.blogspot.com/-sPWLoOkVooE/VFk8iztDsjI/AAAAAAAABG8/n5be823LK-o/s1600/affiche%2Bekiden%2B2015.jpg",
  }]


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
User.last.bibs.create({price: price.sample, quantity: 1, sale_reason: reason.sample, race: Race.last})
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
