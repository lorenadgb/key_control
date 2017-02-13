class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :mother
      t.string :father
      t.string :cpf
      t.string :nationality
      t.string :gender
      t.date :birthdate

      t.string :email
      t.string :phone_number
      t.string :mobile_number
      t.string :fax

      t.timestamps
    end
  end
end
