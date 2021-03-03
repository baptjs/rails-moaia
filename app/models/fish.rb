class Fish < ApplicationRecord
  has_many :spottings, dependent: :destroy
  # has_one_attached :photo
end
