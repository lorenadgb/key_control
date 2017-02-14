class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.string  :building_type
      t.string  :observation
      t.boolean :active, default: true

      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
