class AddStatusToKeys < ActiveRecord::Migration[5.0]
  def change
    add_column :keys, :status, :string, default: KeyStatus::AVAILABLE
  end
end
