class Fish < ApplicationRecord
  has_many :spottings, dependent: :destroy
end
