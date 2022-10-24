class CreateTestPassagesBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passages_badges do |t|
      t.references :test_passage, foreign_key: true
      t.references :badge, foreign_key: true

      t.timestamps
    end
  end
end
