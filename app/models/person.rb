class Person < ApplicationRecord
  extend EnumerateIt

  validates :name, :cpf, :email, :mobile_number, :personable_type, presence: true
  validates :email, :cpf, uniqueness: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  has_enumeration_for :gender
  has_enumeration_for :personable_type

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  scope :owners,   -> { where( personable_type: PersonableType::OWNER ) }
  scope :realtors, -> { where( personable_type: PersonableType::REALTOR ) }
  scope :visitors, -> { where( personable_type: PersonableType::VISITOR ) }

end
