class DiveTypeTag < ApplicationRecord
  has_many :dive_type_taggings, dependent: :destroy
end
