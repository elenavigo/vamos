class Project < ApplicationRecord
  belongs_to :ngo
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :title, length: { maximum: 40 }, uniqueness: true, presence: true
  validates :hours_per_week, presence: true
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true
  validates :capacity, presence: true
  validates :category, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
