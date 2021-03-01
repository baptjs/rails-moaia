class Spot < ApplicationRecord
  after_create :init_spot_tags
  # include PgSearch::Model
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  has_many :likes
  has_many :spot_tags, dependent: :destroy
  has_many :tags, through: :spot_tags

  validates :name, presence: true, uniqueness: true
  validates :region, presence: true
  validates :latitude, presence: true, inclusion: {in: 0..90}
  validates :longitude, presence: true, inclusion: {in: 0..180}
  validates :description, presence: true
  validates :photos, presence: true

  private

  def init_spot_tags
    self.init_tags.each do |tag_id|
      SpotTag.create(tag: Tag.find(tag_id), spot: self)
    end
  end

end
