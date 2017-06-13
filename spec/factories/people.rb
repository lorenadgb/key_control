FactoryGirl.define do
  factory :person do

    factory :lorena do
      name 'Lorena Bento'
      personable_type PersonableType::OWNER
      person_type PersonType::INDIVIDUAL
      cpf_cnpj '000.000.000-00'
      gender Gender::FEMALE
    end

    factory :pollyanna do
      name 'Pollyanna Bento'
      personable_type PersonableType::VISITOR
      person_type PersonType::INDIVIDUAL
      cpf_cnpj '000.000.000-00'
      gender Gender::FEMALE
    end

    factory :gloria do
      name 'Glória Gonçalves'
      personable_type PersonableType::REALTOR
      person_type PersonType::INDIVIDUAL
      cpf_cnpj '000.000.000-00'
      gender Gender::FEMALE
    end

    factory :LDGB do
      name 'LDGB LTDA'
      personable_type PersonableType::OWNER
      person_type PersonType::COMPANY
      cpf_cnpj '00.000.000/0000-00'
    end

  end
end
