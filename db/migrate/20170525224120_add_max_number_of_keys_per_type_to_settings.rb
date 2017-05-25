class AddMaxNumberOfKeysPerTypeToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :max_number_of_keys_per_type, :integer
  end
end
