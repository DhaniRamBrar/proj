class StaticPage < ApplicationRecord
 
 
    def self.ransackable_attributes(auth_object = nil)
      %w[id title slug content created_at updated_at]
    end
    def self.ransackable_associations(auth_object = nil)
      []
    end

  end
  
