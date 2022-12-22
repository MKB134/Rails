class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.string :rule, null: false
      t.integer :rule_options
    end
  end
end
