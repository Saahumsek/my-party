class Place < ApplicationRecord
  geocoded_by :address
  belongs_to :user
  after_validation :geocode, if: :address_changed?
  has_many :bookings, dependent: :destroy
  has_attachments :photos, maximum: 5
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :capacity, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
