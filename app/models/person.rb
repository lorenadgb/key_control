class Person < ApplicationRecord
  extend EnumerateIt

  validates :name, :personable_type, :person_type, presence: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, allow_nil: true, if: :email?

  has_enumeration_for :gender
  has_enumeration_for :personable_type
  has_enumeration_for :person_type

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  has_many :visits
  has_many :buildings

  default_scope { order(created_at: :desc) }

  scope :owners,   -> { where( personable_type: PersonableType::OWNER ) }
  scope :realtors, -> { where( personable_type: PersonableType::REALTOR ) }
  scope :visitors, -> { where( personable_type: PersonableType::VISITOR ) }
  scope :by_building_id, -> (building_id){ Person.joins(:buildings).where(buildings: {id: building_id}) }

  before_destroy :has_visits?
  before_destroy :has_buildings?

  private

  def has_visits?
    if Visit.by_owner_id(self.id).any? || Visit.by_realtor_id(self.id).any? || Visit.by_visitor_id(self.id).any?
      errors.add(:base, I18n.t('models.person.errors.has_visit'))
      throw :abort
    end
  end

  def has_buildings?
    if Building.by_person_id(self.id).any?
      errors.add(:base, I18n.t('models.person.errors.has_building'))
      throw :abort
    end
  end
end
