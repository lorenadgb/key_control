class Key < ApplicationRecord

  belongs_to :building

  validates :code, presence: true
end
