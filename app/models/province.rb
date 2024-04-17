class Province < ApplicationRecord
    has_many :users
    validates :name, presence: true, uniqueness: true
    def self.ransackable_attributes(auth_object = nil)
        %w[name gst pst hst]
    end
end
