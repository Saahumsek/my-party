class Place < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :capacity, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

end
