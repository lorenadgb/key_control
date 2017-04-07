class BuildingStatus < EnumerateIt::Base
  associate_values :available, :rented, :sold
end
