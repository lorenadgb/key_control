class Visit < ApplicationRecord

  belongs_to :key
  belongs_to :building
  belongs_to :owner,   class_name: 'Person'
  belongs_to :visitor, class_name: 'Person'
  belongs_to :realtor, class_name: 'Person'

  validates :building_id, :key_id, :owner, :visitor, :realtor, :start_at, presence: true

  before_create do
    self.set_status_to_borrowed
  end

  before_destroy :check_if_the_key_is_available

  scope :finished_at_is_nil, -> { where(finished_at: nil) }
  scope :by_key_id, ->(key) { where( key_id: key ).finished_at_is_nil.last }
  scope :by_owner_id,   ->(owner)   { where( owner_id: owner ) }
  scope :by_visitor_id, ->(visitor) { where( visitor_id: visitor ) }
  scope :by_realtor_id, ->(realtor) { where( realtor_id: realtor ) }

  def set_status_to_borrowed
    self.key.update_key_status_to_borrowed
  end

  def set_status_to_available
    self.key.update_key_status_to_available
  end

  def update_finished_at
    update_column :finished_at, Time.now
  end

  private

  def check_if_the_key_is_available
    throw :abort unless self.key.status == KeyStatus::AVAILABLE
  end
end
