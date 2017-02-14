class BuildingType < EnumerateIt::Base
  associate_values :apartment, :home, :room, :shop
end
