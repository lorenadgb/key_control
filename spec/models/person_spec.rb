require 'rails_helper'

RSpec.describe Person, type: :model do
  subject { FactoryGirl.create(:lorena) }

  context 'Relationships' do
    it { should have_one :address }
    it { should have_many :buildings }
  end

  context 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :personable_type }
    it { should validate_presence_of :person_type }
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
