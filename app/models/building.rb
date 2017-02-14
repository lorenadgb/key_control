class Building < ApplicationRecord

  belongs_to :owner

  validates :building_type, :owner, presence: true
end
