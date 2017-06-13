require 'rails_helper'

RSpec.describe RealStateAgency, type: :model do
  subject { FactoryGirl.create(:ld_imoveis) }

  context 'Relationships' do
    it { should have_one :address }
    it { should have_one :setting }
  end
end
