class CreateRecruitments < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitments do |t|
      t.integer :end_user_id, null: false, default: ""
      t.string :title, default: "", null: false
      t.text :comment, null: false, default: ""
      t.timestamps
    end
  end
end
