class Spot < ApplicationRecord
  # include PgSearch::Model
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  has_many :likes
  has_many :spot_tags, dependent: :destroy
  has_many :tags, through: :spot_tags

  validates :name, presence: true, uniqueness: true
  validates :region, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true

  # pg_search_scope :search_by_spot_name,
  #   against: [ :description, :address ],
  #   using: {
  #     tsearch: { prefix: true }
    # }

end
