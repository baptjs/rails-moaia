class Spot < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :photos
  has_many :likes

  # validates :name, presence: true, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true
end
