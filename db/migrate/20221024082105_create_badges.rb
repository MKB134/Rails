class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :image_path
      t.integer :rule
      t.string :value

      t.timestamps
    end
  end
end
