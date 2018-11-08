module AgencySubscribing
    extend ActiveSupport::Concern
    included do
        has_many :active_relationships, class_name: "AgencyClientRelationship", foreign_key: "active_client_id", dependent: :destroy
        has_many :agencies, through: :active_relationships, source: :agency
        
        has_many :passive_relationships, class_name: "AgencyClientRelationship", foreign_key: "agency_id", dependent: :destroy
        has_many :active_clients, through: :passive_relationships, source: :active_client
    end
end