class RenamePersonReferences < ActiveRecord::Migration[5.0]
  def change
    rename_column :buildings, :owner_id, :person_id
  end
end
