class CreateRealStateAgencies < ActiveRecord::Migration[5.0]
  def change
    create_table :real_state_agencies do |t|
      t.string :trade_name
      t.string :cnpj
      t.string :email
      t.string :mobile_number
      t.string :phone_number
      t.string :fax
      t.string :social_name

      t.timestamps
    end
  end
end
