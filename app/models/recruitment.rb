class Recruitment < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user
  has_many :replies, dependent: :destroy
  has_many :favorites, dependent: :destroy
    
  def favorited_by?(end_user)
    favorites.exists?(end_user: end_user.id)
  end
  
  validates :title,presence:true, length: { maximum: 20 }
  validates :comment,presence:true, length: { maximum: 100 }
end