class AddPersonTypeToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :person_type, :string, default: PersonType::INDIVIDUAL
  end
end
