class CreateBadgesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :badges_users do |t|
      t.references :user, foreign_key: true, null: false
      t.references :badge, foreign_key: true, null: false
    end
  end
end
