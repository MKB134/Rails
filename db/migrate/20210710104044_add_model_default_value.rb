class AddModelDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tests, :level, 0
    change_column_default :answers, :answer, false 
  end
end
