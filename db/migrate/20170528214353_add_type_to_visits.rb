class AddTypeToVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :visit_type, :string
  end
end
