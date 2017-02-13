class Owner < ApplicationRecord

  validates :name, :cpf, :email, :mobile_number, presence: true
  validates :email, :cpf, uniqueness: true

end
