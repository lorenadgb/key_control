class Key < ApplicationRecord
  self.per_page = 96

  belongs_to :building, optional: true

  validates :code, presence: true
  validates :code, numericality: {only_integer: true}

  scope :by_code, -> (code){ where( code: code ) }
  scope :by_building_id, -> (building_id){ where( building_id: building_id ) }
  scope :by_owner_id, -> (owner_id){ Key.joins(:building).where(buildings: {person_id: owner_id}) }
  scope :availables, -> { Key.joins(:building).where(buildings: {status: BuildingStatus::AVAILABLE}).where( status: KeyStatus::AVAILABLE ) }
  scope :actives, -> { Key.joins(:building).where(buildings: {active: true}) }
  scope :order_by_source_and_code, ->{ order('buildings.source asc, keys.code::integer asc') }
  scope :by_source, -> (source){ Key.joins(:building).where(buildings: {source: source}) }

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
end
