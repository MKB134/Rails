class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.boolean :status, null: false
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false


      t.timestamps
    end
  end
end
