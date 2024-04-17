class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  belongs_to :province, optional: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id email full_address province_id created_at updated_at]
  end
end
