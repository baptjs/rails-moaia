class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  has_many :spottings, dependent: :destroy
  has_many :fishes, through: :spottings

  validates :date, presence: true
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: (0..5) }
end
