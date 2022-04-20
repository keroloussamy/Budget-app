class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.timestamps

      t.references :user, null: false, foreign_key: true
    end
  end
end
