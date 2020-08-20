class Bike < ApplicationRecord
  BIKE_STYLE = ['VTC', 'VTT', 'Vélo de ville']
  BIKE_COLOR = ['Argenté', 'Blanc', 'Bleu', 'Doré', 'Gris', 'jaune', 'Orange', 'Rouge', 'Vert']
  BIKE_GENDER = ['Homme', 'Femme']
  BIKE_CITY = ['Nantes', 'Rennes', 'Lorient', 'Vannes', 'Arradon','Arzon', 'Sarzeau', 'Baden', 'Bono', 'Carnac', 'La Trinité sur mer']
  belongs_to :user
  has_many_attached :photos
  has_many :reviews

  validates :model, presence: true
  validates :address, presence: true
  validates :gender, presence: true
  validates :color, presence: true
  validates :gear, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :style, presence: true
end
