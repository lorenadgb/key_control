class AddCodeToBuildings < ActiveRecord::Migration[5.0]
  def change
    add_column :buildings, :code, :string
  end
end
