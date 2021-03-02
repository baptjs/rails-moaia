class Spot < ApplicationRecord
  after_create :init_taggings
  # include PgSearch::Model
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  has_many :likes

  has_many :dive_type_taggings, dependent: :destroy
  has_many :dive_type_tags, through: :dive_type_taggings
  has_many :difficulty_taggings, dependent: :destroy
  has_many :difficulty_tags, through: :difficulty_taggings
  has_many :attractions_taggings, dependent: :destroy
  has_many :attractions_tags, through: :attractions_taggings

  validates :name, presence: true, uniqueness: true
  validates :region, presence: true
  validates :latitude, presence: true, inclusion: {in: -90..90}
  validates :longitude, presence: true, inclusion: {in: -180..180}
  validates :description, presence: true
  validates :photos, presence: true

  private

  def init_taggings
    self.init_dive_type_tags.each do |tag_id|
      DiveTypeTagging.create(tag: DiveTypeTag.find(tag_id), spot: self)
    end

    self.init_difficulty_tags.each do |tag_id|
      DifficultyTagging.create(tag: DifficultyTag.find(tag_id), spot: self)
    end

    self.init_attractions_tags.each do |tag_id|
      AttractionsTagging.create(tag: AttractionsTag.find(tag_id), spot: self)
    end
  end

end
