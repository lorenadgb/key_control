class Person < ApplicationRecord
  extend EnumerateIt

  validates :name, :cpf, :email, :mobile_number, presence: true
  validates :email, :cpf, uniqueness: true

  has_enumeration_for :gender

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
end
