class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, null: false
      t.references :question_id, null: false

      t.timestamps
    end
  end
end
