require 'rails_helper'

RSpec.describe Key, type: :model do
  subject { FactoryGirl.create(:villareal).keys.first }

  context 'Relationships' do
    it { should belong_to :building }
    it { should have_many :visits }
  end

  it 'should display the key code with building prefix' do
    expect(subject.code_with_prefix).to eq('A01')
  end
end
