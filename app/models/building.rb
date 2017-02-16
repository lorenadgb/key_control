class Building < ApplicationRecord
  extend EnumerateIt

  belongs_to :owner

  validates :building_type, :owner, presence: true

  has_enumeration_for :building_type

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
end
