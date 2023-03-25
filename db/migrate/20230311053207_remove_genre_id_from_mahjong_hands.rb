class RemoveGenreIdFromMahjongHands < ActiveRecord::Migration[6.1]
  def up
    remove_column :mahjong_hands, :genre_id, :integer
  end
  def down
    add_column :mahjong_hands, :genre_id, :integer
  end 
end
