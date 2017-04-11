class Person < ApplicationRecord
  extend EnumerateIt

  validates :name, :cpf_cnpj, :email, :mobile_number, :personable_type, presence: true
  validates :email, :cpf_cnpj, uniqueness: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  has_enumeration_for :gender
  has_enumeration_for :personable_type

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  has_many :visits

  scope :owners,   -> { where( personable_type: PersonableType::OWNER ) }
  scope :realtors, -> { where( personable_type: PersonableType::REALTOR ) }
  scope :visitors, -> { where( personable_type: PersonableType::VISITOR ) }

  before_destroy :has_visits?
  before_destroy :has_buildings?

  private

  def has_visits?
    if Visit.by_owner_id(self.id).any? || Visit.by_realtor_id(self.id).any? || Visit.by_visitor_id(self.id).any?
      throw :abort
    end
  end

  def has_buildings?
    if Building.by_person_id(self.id).any?
      throw :abort
    end
  end
end
