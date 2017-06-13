require 'rails_helper'

RSpec.describe Building, type: :model do
  subject { FactoryGirl.create(:villareal) }

  context 'Relationships' do
    it { should have_one :address }
    it { should belong_to :person }
    it { should have_many :keys }
    it { should have_many :visits }
  end

  context 'Validations' do
    it { should validate_presence_of :code }
    it { should validate_presence_of :status }
    it { should validate_presence_of :building_type }
    it { should validate_presence_of :source }
    it { should validate_presence_of :person }
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a person' do
    subject.person = nil
    expect(subject).to_not be_valid
  end

  it 'can not disable a building with visit associated' do
    FactoryGirl.create(:visita, building: subject, owner: subject.person, key: subject.keys.first)

    expect(subject.can_be_disabled?).to eq(false)
  end

  it 'can disable a building without visit associated' do
    expect(subject.can_be_disabled?).to eq(true)
  end

  it 'prefix should be the first source char' do
    expect(subject.prefix).to eq('A')
  end
end
