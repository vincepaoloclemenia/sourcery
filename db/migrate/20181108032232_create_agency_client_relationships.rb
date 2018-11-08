class CreateAgencyClientRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :agency_client_relationships do |t|
      t.integer :agency_id
      t.references :client, foreign_key: true
      t.date :transaction_date
      
      t.timestamps
    end
  end
end
