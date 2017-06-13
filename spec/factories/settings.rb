FactoryGirl.define do
  factory :setting do

    factory :setting_01 do
      display_blank_codes true
      keychain_height nil
      keychain_width nil
      max_number_of_keys_per_type 150

      association :real_state_agency, factory: :ld_imoveis
    end

  end
end
