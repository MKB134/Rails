class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body
      t.string :test_id
      t.integer :

      t.timestamps
    end
  end
end
