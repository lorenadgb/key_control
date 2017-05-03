class AddNameAndActiveToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :active, :boolean, default: true
  end
end
