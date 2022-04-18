class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.integer :amount
      t.timestamps
      
      t.references :user, null: false, foreign_key: true
    end
  end
end
