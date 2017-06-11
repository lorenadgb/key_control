class Key < ApplicationRecord
  self.per_page = 96

  belongs_to :building, optional: true

  has_many :visits

  before_destroy :has_visits?

  validates :code, presence: true
  validates :code, numericality: {only_integer: true}

  scope :by_code, -> (code){ where( code: [code] ) }
  scope :by_building_id, -> (building_id){ where( building_id: building_id ) }
  scope :by_owner_id, -> (owner_id){ Key.joins(:building).where(buildings: {person_id: owner_id}) }
  scope :availables, -> { Key.joins(:building).where(buildings: {status: BuildingStatus::AVAILABLE}).where( status: KeyStatus::AVAILABLE ) }
  scope :actives, -> { Key.joins(:building).where(buildings: {active: true}) }
  scope :order_by_source_and_code, ->{ order('buildings.source asc, keys.code::integer asc') }
  scope :by_source, -> (source){ Key.joins(:building).where(buildings: {source: source}) }
  scope :gteq_code, -> (code){ where( "keys.code::integer >= #{code.to_i}" ) }
  scope :lteq_code, -> (code){ where( "keys.code::integer <= #{code.to_i}" ) }

  delegate :source, :to => :building

  def update_key_status_to_borrowed
    update_column :status, KeyStatus::BORROWED
  end

  def update_key_status_to_available
    update_column :status, KeyStatus::AVAILABLE
  end

  def code=(value)
    self[:code] = value.gsub(/\s+/, '')
  end

  def code_with_prefix
    "#{self.building.prefix}#{self.code}"
  end

  def self.search(value, source)
    value ? where("keys.code ILIKE :value AND source = '#{source}'", value: "%#{value}%") : all
  end

  def self.codes_not_in_use(source)
    [(1..max_number_of_keys_per_type).to_a.map(&:to_s)].flatten - [self.availables.by_source(source).order_by_source_and_code.map(&:code)].flatten
  end

  def self.max_number_of_keys_per_type
    real_state_agency.max_number_of_keys_per_type
  end

  def self.real_state_agency
    RealStateAgency.first
  end

  private

  def has_visits?
    if self.visits.any?
      errors.add(:base, I18n.t('models.key.errors.has_visits'))
      throw :abort
    end
  end
end
