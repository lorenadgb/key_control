class AddBuildingSourceToBuildings < ActiveRecord::Migration[5.0]
  def change
    add_column :buildings, :source, :string
  end
end
