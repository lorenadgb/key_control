class Building < ApplicationRecord
  extend EnumerateIt

  belongs_to :person

  validates :building_type, :person, :code, presence: true

  validate :at_least_one_key

  has_enumeration_for :building_type

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  has_many :keys, dependent: :destroy
  accepts_nested_attributes_for :keys, allow_destroy:  true

  has_many :visits, dependent: :destroy

  scope :actives, -> { where( active: true ) }

  private

  def at_least_one_key
    false if self.keys.first.nil?
  end
end
