class Genre < ApplicationRecord
  #検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @genre = Genre.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @genre = Genre.where("name LIKE?", "#{word}")
    else
      @genre = Genre.all
    end
  end
end
