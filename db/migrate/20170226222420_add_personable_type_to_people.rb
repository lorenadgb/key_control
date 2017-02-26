class AddPersonableTypeToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :personable_type, :string
  end
end
