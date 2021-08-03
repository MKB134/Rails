class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :category, :title
  end
end
