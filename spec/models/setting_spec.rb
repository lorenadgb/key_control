require 'rails_helper'

RSpec.describe Setting, type: :model do
  subject { FactoryGirl.create(:setting_01) }

  context 'Relationships' do
    it { should belong_to :real_state_agency }
  end

  context 'Validations' do
    it { should validate_presence_of :max_number_of_keys_per_type }
  end
end
