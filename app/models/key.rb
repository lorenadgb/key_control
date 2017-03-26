class Key < ApplicationRecord

  belongs_to :building, optional: true

  validates :code, presence: true

  scope :availables, -> { where( status: KeyStatus::AVAILABLE ) }

  def update_key_status_to_borrowed
    update_column :status, KeyStatus::BORROWED
  end

  def update_key_status_to_available
    update_column :status, KeyStatus::AVAILABLE
  end
end
