class Visit < ApplicationRecord

  belongs_to :key
  belongs_to :building
  belongs_to :owner,   class_name: 'Person'
  belongs_to :visitor, class_name: 'Person'

  validates :building, :key_id, :owner, :visitor, :date, presence: true

end
