class Visit < ApplicationRecord

  belongs_to :key
  belongs_to :building
  belongs_to :owner,   class_name: 'Person'
  belongs_to :visitor, class_name: 'Person'

  validates :building_id, :key_id, :owner, :visitor, :start_at, presence: true

  before_create do
    self.set_status_to_borrowed
  end

  scope :finished_at_is_nil, -> { where(finished_at: nil) }
  scope :by_key_id, ->(key) { where( key_id: key ).finished_at_is_nil.last }

  def set_status_to_borrowed
    self.key.update_key_status_to_borrowed
  end

  def set_status_to_available
    self.key.update_key_status_to_available
  end

  def update_finished_at
    update_column :finished_at, Time.now
  end
end
