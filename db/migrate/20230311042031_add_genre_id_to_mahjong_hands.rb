class AddGenreIdToMahjongHands < ActiveRecord::Migration[6.1]
  def change
    add_column :mahjong_hands, :genre_id, :integer
  end
end
