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
    picture: "https://unsplash.it/200/300/?random",
    level: "sunday",
    password: "1235689"
  },
  {
    first_name: "Louis",
    last_name: "Pons",
    email: "louispons@gmail.com",
    age: 21,
    picture: "https://unsplash.it/200/300/?random",
    level: "professional",
    password: "mypswd"
  },
  {
    first_name: "Sylvain",
    last_name: "Volpeo",
    email: "volpeo@orange.net",
    age: 28,
    picture: "https://unsplash.it/200/300/?random",
    level: "runner",
    password: "thisismysecret"
  },
  {
    first_name: "Florent",
    last_name: "Surfer",
    email: "iamata@hotmail.com",
    age: 26,
    picture: "https://unsplash.it/200/300/?random",
    level: "regular",
    password: "872BDUIOjsi"
  },
  {
    first_name: "Josiane",
    last_name: "Rodriguez",
    email: "rodriguez@josiane.com",
    age: 67,
    picture: "https://unsplash.it/200/300/?random",
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
    picture: "https://unsplash.it/600/300?random&gravity=center",
  },
  {
    name: "Le givré de la plaine de Carbon-Blanc",
    address: "Carbon-Blanc",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "FFA",
    distance: 30,
    picture: "https://unsplash.it/600/300?random&gravity=center",
  },
  {
    name: "Itsas Laminen Corrika",
    address: "Listrac-Médoc",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "No label",
    distance: 60,
    picture: "https://unsplash.it/600/300?random&gravity=center",
  },
  {
    name: "Le Trail des Mouflons",
    address: "Libourne",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "FFA",
    distance: 45,
    picture: "https://unsplash.it/600/300?random&gravity=center",
  },
  {
    name: "Ekiden du CA Villenave",
    address: "Villenave d'Ornon",
    date: Faker::Date.forward(50),
    race_type: Race::CATEGORIES.sample,
    label: "Trail Nature",
    distance: 23,
    picture: "https://unsplash.it/600/300?random&gravity=center",
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

