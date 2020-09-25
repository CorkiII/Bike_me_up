# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
Booking.destroy_all
Bike.destroy_all
User.destroy_all

User.create!(
  email: 'chloe@bikemeup.fr',
  password: '123456',
  first_name: "Chloe",
  last_name: "Rihouay",
  username: "chloer"
)

address = ['Nantes', 'Rennes', 'Paris', 'Vannes', 'Lyon','Marseille', 'Bordeaux', 'Nice', 'Strasbourg', 'Lille', 'Clermont-Ferrand']
gender = ['homme', 'femme']
style = ['VTC', 'VTT', 'Vélo de ville']
description = ['Idéal pour les déplacements en ville pour la balade, les courses ou le travail.', 'Idéal pour les balades et les randonnées sur tous types de revêtements et dans toutes les conditions.', 'Idéal pour les balades sportives et les courses cyclistes.']
model = ['Vélo route', 'Vélo piste', 'Fixie', 'Vélo de ville', 'VTT', 'Vélo hollandais', 'Randonneuse']
review = [ "Parfait ce vélo !", "En bon état, nous a suivi pendant tout notre tour du golf ! Je recommande", "Loueur très sympathique et vélo en parfait état. Pour des vacances avec style."]

require 'open-uri'
require 'nokogiri'

url = 'http://www.lachouetteparis.com/bikes'

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

image_urls = []

html_doc.search('img').each do |element|
  image_urls << element.attribute('data-image').value if element.attribute('data-image')
end

image_urls.sample(200).each do |url|
  file = URI.open(url)
  bike = Bike.create!(
    model: model.sample,
    address: address.sample,
    gender: gender.sample,
    color: Faker::Color.color_name,
    gear: rand(0..18),
    description: description.sample,
    price: rand(15..30),
    style: style.sample,
    user: User.last)
  bike.photos.attach(io: file, filename: 'bike.jpg', content_type: 'image/jpg')
end

500.times do
  Review.create(bike: Bike.all.sample, content: review.sample, user: User.last)
end

puts "Bikes created with photos!"


