class DifficultyTagging < ApplicationRecord
  belongs_to :spot
  belongs_to :difficulty_tag
end
