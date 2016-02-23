# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Race.destroy_all
Bib.destroy_all

require "faker"



10.times do
  user = User.new({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    age: 21,
    remote_picture_url: "https://unsplash.it/200/300/?random",
    level: "professional"

  })
  user.save
  race = Race.new({
    name: "course des pins perdus",
    address: Faker::Address.city,
    date: Faker::Date.forward(50),
    type: "marathon",
    label: "FFA",
    remote_picture_url: "https://unsplash.it/600/300?random&gravity=center",
  })
  race.save

  reason = ["disabled", "forgotten", "absent","injured"]

  user.bibs.create({price: 15, quantity: 1, sale_reason: reason.sample, race: race})
end
