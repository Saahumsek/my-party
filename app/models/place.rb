class Place < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_attachments :photos, maximum: 5

  validates :name, presence: true
  validates :address, presence: true
  validates :capacity, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

end
