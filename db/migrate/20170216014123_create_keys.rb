class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.string :code
      t.string :description
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
