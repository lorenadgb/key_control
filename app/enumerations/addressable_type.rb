class AddressableType < EnumerateIt::Base
  associate_values :building, :owner, :real_state_agency
end
