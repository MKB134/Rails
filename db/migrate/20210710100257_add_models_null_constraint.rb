class AddModelsNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :body, :false)
    change_column_null(:categories, :title, :false)
    change_column_null(:categories, :level, :false)
    change_column_null(:questions, :body, :false)
    change_column_null(:questions, :test_id, :false)
    change_column_null(:users, :name, :false)
  end
end
