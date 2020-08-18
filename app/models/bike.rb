class Bike < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :model, presence: true
  validates :address, presence: true
  validates :gender, presence: true
  validates :color, presence: true
  validates :gear, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :style, presence: true
end
