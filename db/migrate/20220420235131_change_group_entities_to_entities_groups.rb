class ChangeGroupEntitiesToEntitiesGroups < ActiveRecord::Migration[7.0]
  def change
    rename_table :group_entities, :entities_groups
  end
end
