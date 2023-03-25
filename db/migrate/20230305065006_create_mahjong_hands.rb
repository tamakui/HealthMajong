class CreateMahjongHands < ActiveRecord::Migration[6.1]
  def change
    create_table :mahjong_hands do |t|
      t.string :name, null: false
      t.text :describe, null: false
      t.timestamps
    end
  end
end
