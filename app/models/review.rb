class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  has_many :spottings, dependent: :destroy
  has_many :fishes, through: :spottings
  has_many_attached :photos

  validates :date, presence: true
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: (0..5) }

  after_create :create_spottings

  private

  def create_spottings
    self.fish_ids.each do |fish_id|
      Spotting.create(fish: Fish.find(fish_id), review: self)
    end
  end
end
