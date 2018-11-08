class RenameColumnForRelationship < ActiveRecord::Migration[5.1]
  def change
    rename_column :agency_client_relationships, :client_id, :active_client_id
  end
end
