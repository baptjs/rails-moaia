class Spotting < ApplicationRecord
  belongs_to :fish
  belongs_to :review

  validates :number, presence: true
end
