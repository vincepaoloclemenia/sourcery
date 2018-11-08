class Client < ApplicationRecord

    has_many :employments, dependent: :destroy
    has_many :users, through: :employments, dependent: :destroy
   
    include AgencySubscribing

    def is_agency?
        agency
    end
    
end
