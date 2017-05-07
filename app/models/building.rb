class Building < ApplicationRecord
  extend EnumerateIt

  belongs_to :person

  validates :status, :building_type, :source, :person, :code, presence: true

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

  default_scope { order(created_at: :desc) }

  def can_be_disabled?
    if Visit.by_building_id(self.id).empty?
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

  private

  def at_least_one_key
    false if self.keys.first.nil?
  end
end
