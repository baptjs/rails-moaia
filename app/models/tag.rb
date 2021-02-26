class Tag < ApplicationRecord
  has_many :spot_tags, dependent: :destroy
end
