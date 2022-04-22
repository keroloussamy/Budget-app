class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :groups, :user_id, :author_id
    rename_column :entities, :user_id, :author_id
  end
end
