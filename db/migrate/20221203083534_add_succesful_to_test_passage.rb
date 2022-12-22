class AddSuccesfulToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :sucessful, :boolean, null: false, default: false
  end
end
