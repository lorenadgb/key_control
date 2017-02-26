class Person < ApplicationRecord
  extend EnumerateIt

  validates :name, :cpf, :email, :mobile_number, :personable_type, presence: true
  validates :email, :cpf, uniqueness: true

  has_enumeration_for :gender
  has_enumeration_for :personable_type

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
end
