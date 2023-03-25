class CreateRecruitments < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitments do |t|
      t.integer :end_user_id, null: false
      t.string :title, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
