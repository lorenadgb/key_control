class RenameDescriptionToObservation < ActiveRecord::Migration[5.0]
  def change
    rename_column :keys, :description, :observation
  end
end
