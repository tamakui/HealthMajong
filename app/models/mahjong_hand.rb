class MahjongHand < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  
  #イメージ画像
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
  
  #検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @mahjong_hand = MahjongHand.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @mahjong_hand = MahjongHand.where("name LIKE?", "#{word}")
    else
      @mahjong_hand = MahjongHand.all
    end
  end
end
