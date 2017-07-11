class Building < ApplicationRecord
  extend EnumerateIt

  belongs_to :person

  validates :status, :building_type, :source, :person, :code, presence: true
  validates :code, uniqueness: true

  validate :at_least_one_key

  has_enumeration_for :building_type
  has_enumeration_for :status, with: BuildingStatus
  has_enumeration_for :source, with: BuildingSource

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  has_many :keys, dependent: :destroy
  accepts_nested_attributes_for :keys, allow_destroy:  true

  has_many :visits, dependent: :destroy

  scope :actives, -> { where( active: true ) }
  scope :by_person_id, -> (person_id){ where( person_id: person_id ) }
  scope :by_source, -> (source){ where(source: source) }
  scope :by_status, -> (status){ where(status: status) }
  scope :availables, -> { where(status: BuildingStatus::AVAILABLE) }
  scope :by_type, -> (type){ where(building_type: type) }
  scope :gteq_code, -> (code){ where( "code::integer >= #{code.to_i}" ) }
  scope :lteq_code, -> (code){ where( "code::integer <= #{code.to_i}" ) }

  scope :order_by_key_code, -> { Building.joins(:keys).order('keys.code::integer asc') }
  scope :order_by_created_at, -> { order(created_at: :desc) }

  delegate :full_address, to: :address

  def can_be_disabled?
    if Visit.by_building_id(self.id).finished_at_is_nil.empty?
      update_column :active, false
    else
      false
    end
  end

  def enable
    update_column :active, true
  end

  def prefix
    "#{source_humanize.upcase[0]}"
  end

  def self.search(value)
    value ? joins(:person).where("code ILIKE :value OR people.name ILIKE :value OR cpf_cnpj ILIKE :value OR email ILIKE :value", value: "%#{value}%") : all
  end

  private

  def at_least_one_key
    false if self.keys.first.nil?
  end
end
