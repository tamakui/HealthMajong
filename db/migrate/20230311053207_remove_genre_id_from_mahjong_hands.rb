class RemoveGenreIdFromMahjongHands < ActiveRecord::Migration[6.1]
  def change
    remove_column :mahjong_hands, :'genre_id：integer', :string
  end
end
