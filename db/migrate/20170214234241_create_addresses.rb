class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.integer :number
      t.string :complement
      t.string :street_type
      t.string :city
      t.string :neighborhood
      t.string :observation

      t.timestamps
    end
  end
end
