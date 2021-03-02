class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spots, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages
  has_many :conversations, through: :messages
  # has_one_attached :photos

  # validates :nickname, presence: true, uniqueness: true
  def photos
    results = []
    return results if self.reviews.empty?

    self.reviews.each do |review|
      review.photos.each do |photo|
        results << photo
      end
    end
    return results
  end
end
