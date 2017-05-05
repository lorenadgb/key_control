class BuildingType < EnumerateIt::Base
  associate_values :apartment, :home, :plot, :room, :shed, :shop, :small_farm
end
