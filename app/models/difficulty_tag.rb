class DifficultyTag < ApplicationRecord
  has_many :difficulty_taggings, dependent: :destroy
end
