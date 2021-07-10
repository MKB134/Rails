class AddCorrectToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :answer, :boolean
  end
end
