FactoryGirl.define do
  factory :visit do

    factory :visita do
      building nil
      key      []

      visit_type VisitType::EVALUATION

      association :owner,   factory: :lorena
      association :visitor, factory: :pollyanna
      association :realtor, factory: :gloria

      start_at Time.now
    end

  end
end
