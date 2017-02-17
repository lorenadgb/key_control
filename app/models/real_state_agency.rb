class RealStateAgency < ApplicationRecord
  extend EnumerateIt

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
end
