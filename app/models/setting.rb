class Setting < ApplicationRecord

  belongs_to :real_state_agency

  validates :max_number_of_keys_per_type, presence: true
  validates_numericality_of :max_number_of_keys_per_type, greater_than: 0

end
