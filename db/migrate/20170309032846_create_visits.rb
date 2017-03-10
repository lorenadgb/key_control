class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.datetime :date
      t.string :observation

      t.references :owner
      t.references :visitor
      t.references :building, foreign_key: true
      t.references :key, foreign_key: true

      t.timestamps
    end
  end
end
