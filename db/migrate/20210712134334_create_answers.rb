class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, null: false
      t.references :question, null: false, foreign_key: {to_table: :questions}

      t.timestamps
    end
  end
end
