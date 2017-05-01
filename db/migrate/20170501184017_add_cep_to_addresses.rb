class AddCepToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :cep, :string
  end
end
