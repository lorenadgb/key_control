FactoryGirl.define do
  factory :building do

    factory :villareal do
      name 'Villa Real'
      code '1505'
      status BuildingStatus::AVAILABLE
      building_type BuildingType::APARTMENT
      source BuildingSource::RENT
      active true

      association :person, factory: :lorena
      keys { [FactoryGirl.create(:main_door_01), FactoryGirl.create(:garage)] }
    end

    factory :veredas do
      name 'Veredas'
      code '2589'
      status BuildingStatus::AVAILABLE
      building_type BuildingType::HOME
      source BuildingSource::RENT
      active true

      association :person, factory: :LDGB
      keys { [FactoryGirl.create(:main_door_01)] }
    end

    factory :onix do
      name 'Ônix'
      code '1040'
      status BuildingStatus::AVAILABLE
      building_type BuildingType::SHOP
      source BuildingSource::SALE
      active true

      association :person, factory: :lorena
      keys { [FactoryGirl.create(:main_door_02)] }
    end

  end
end
