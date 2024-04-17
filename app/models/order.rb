class Order < ApplicationRecord
    belongs_to :user
    belongs_to :province, optional: true
    has_many :order_items, dependent: :destroy
    has_many :products, through: :order_items
    accepts_nested_attributes_for :order_items
    validates :grand_total, presence: true
    validates :status, presence: true
    validates :address, presence: true
    validates :province, presence: true
    before_validation :set_default_status, on: :create
    
    def self.ransackable_attributes(auth_object = nil)
        %w[id address status province_id subtotal gst pst hst grand_total created_at updated_at user_id]
    end
    def self.ransackable_associations(auth_object = nil)
        %w[order_items province user]
    end
    private

    def set_default_status
     self.status ||= 'pending' 
    end

end
  