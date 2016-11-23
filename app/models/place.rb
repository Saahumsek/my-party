class Place < ApplicationRecord
  geocoded_by :address
  belongs_to :user
  has_many :bookings
  after_validation :geocode, if: :address_changed?
  validates :name, presence: true
  validates :address, presence: true
  validates :capacity, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

end
