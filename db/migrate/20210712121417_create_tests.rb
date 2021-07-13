class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      t.references :category, null: false, foreign_key:  {to_table: :categories}
      t.references :author, null: false, foreign_key:  {to_table: :users}

      t.timestamps
    end
  end
end
