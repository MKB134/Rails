class ChangeColumnToTable < ActiveRecord::Migration[6.0]
  def change
    change_column_null :test_passages, :current_question_id, true
  end
end
