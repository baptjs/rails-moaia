class Spot < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  # validates :name, presence: true, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true
end
