FactoryGirl.define do
  factory :key do

    factory :main_door_01 do
      code '01'
      observation ''
      status KeyStatus::AVAILABLE
    end

    factory :garage do
      code '02'
      observation 'Senha da garagem: 1234'
      status KeyStatus::AVAILABLE
    end

    factory :main_door_02 do
      code '03'
      observation ''
      status KeyStatus::AVAILABLE
    end

  end
end
