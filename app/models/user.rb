class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :places
  has_many :bookings

  #validates :name

  #validates :age, numericality: { only_integer: true }

  #validates :gender, inclusion: { in: %w(male female), message: "%{value} is not a valid gender" }

end
