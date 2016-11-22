class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :places
  has_many :bookings

  #validates :name
  #validates :gender, inclusion: { in: %w(male female), message: "%{value} is not a valid gender" }

end
