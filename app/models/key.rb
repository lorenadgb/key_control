class Key < ApplicationRecord

  belongs_to :building, optional: true

  validates :code, presence: true
end
