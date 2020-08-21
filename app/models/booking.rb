class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validates :bike_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true

  # include PgSearch::Model
  # pg_search_scope :global_search,
  #   against: [ :start_date, :end_date ],
  #   associated_against: {
  #     bike: :address
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
