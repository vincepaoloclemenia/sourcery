class AgencyClientRelationship < ApplicationRecord
  belongs_to :active_client, class_name: "Client"
  belongs_to :agency, class_name: "Client"
end
