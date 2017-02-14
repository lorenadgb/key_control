class Owner < ApplicationRecord
  extend EnumerateIt

  validates :name, :cpf, :email, :mobile_number, presence: true
  validates :email, :cpf, uniqueness: true

  has_enumeration_for :gender

end
