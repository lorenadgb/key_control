class AddRealtorToVisits < ActiveRecord::Migration[5.0]
  def change
    add_reference :visits, :realtor, index: true
  end
end
