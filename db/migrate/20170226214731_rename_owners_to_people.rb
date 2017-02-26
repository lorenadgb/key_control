class RenameOwnersToPeople < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :owners, :people
  end

  def self.down
    rename_table :people, :owners
  end
end
