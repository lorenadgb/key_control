class Key < ApplicationRecord

  belongs_to :building, optional: true

  validates :code, presence: true

  scope :by_code, -> (code){ where( code: code ) }
  scope :by_building_id, -> (building_id){ where( building_id: building_id ) }
  scope :by_owner_id, -> (owner_id){ Key.joins(:building).where(buildings: {person_id: owner_id}) }
  scope :availables, -> { Key.joins(:building).where(buildings: {status: BuildingStatus::AVAILABLE}).where( status: KeyStatus::AVAILABLE ) }
  scope :actives, -> { Key.joins(:building).where(buildings: {active: true}) }

  def update_key_status_to_borrowed
    update_column :status, KeyStatus::BORROWED
  end

  def update_key_status_to_available
    update_column :status, KeyStatus::AVAILABLE
  end
end
