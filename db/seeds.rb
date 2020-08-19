# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Bike.destroy_all
User.destroy_all

User.create!(
  email: 'chloe@bikemeup.fr',
  password: '123456',
  first_name: "Chloe",
  last_name: "Rihouay",
  username: "chloer"
)

address = ['Nantes', 'Rennes', 'Lorient', 'Vannes', 'Arradon','Arzon', 'Sarzeau', 'Baden', 'Bono', 'Carnac', 'La Trinité sur mer']
gender = ['homme', 'femme']
style = ['VTC', 'VTT', 'Vélo de ville']
description = ['Vélo de ville. Idéal pour les déplacements en ville pour la balade, les courses ou le travail.', 'Vélo à assistance électrique (VAE) pour tous vos déplacements afin d’arriver à destination sans fatigue et sans transpirer.', 'Vélo de randonnée. Idéal pour les balades et les randonnées sur tous types de revêtements et dans toutes les conditions.', 'Vélo de course. Idéal pour les balades sportives et les courses cyclistes.']
model = ['Vélo B-Twin électrique', 'Vélo piste Motobécane', 'Canyon spectral', 'Fixie Lejeune', 'Vélo de ville femme', 'VTT homme Btwin', 'VTT femme Go Sport', 'Vélo de ville femme Gitane', 'Vélo hollandais Peugeot', 'Randonneuse Helium', 'Vélo de ville Raymond Poulidor', 'Vélo Hangler']


require 'open-uri'
require 'nokogiri'

url = 'http://www.lachouetteparis.com/bikes'

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

image_urls = []

html_doc.search('img').each do |element|
  image_urls << element.attribute('data-image').value if element.attribute('data-image')
end

image_urls.sample(5).each do |url|
  file = URI.open(url)
  bike = Bike.create!(
    model: model.sample,
    address: address.sample,
    gender: gender.sample,
    color: Faker::Color.color_name,
    gear: rand(0..18),
    description: description.sample,
    price: rand(10..50),
    style: style.sample,
    user: User.last)
  bike.photos.attach(io: file, filename: 'bike.jpg', content_type: 'image/jpg')
end

puts "Bikes created with photos!"


