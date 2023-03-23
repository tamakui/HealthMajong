class Genre < ApplicationRecord
  #検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @genres = Genre.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @genres = Genre.where("name LIKE?", "%#{word}%")
    else
      @genres = Genre.all
    end
  end

  validates :name, presence: true
end
