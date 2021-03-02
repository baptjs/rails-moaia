class AttractionsTag < ApplicationRecord
  has_many :attractions_taggings, dependent: :destroy
end
