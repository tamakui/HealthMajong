class MahjongHand < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
    
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
