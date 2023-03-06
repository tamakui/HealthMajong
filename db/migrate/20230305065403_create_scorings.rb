class CreateScorings < ActiveRecord::Migration[6.1]
  def change
    create_table :scorings do |t|
      t.integer :host, null: false, default: 0
      t.integer :non_host, null: false, default: 0
      t.timestamps
    end
  end
end
