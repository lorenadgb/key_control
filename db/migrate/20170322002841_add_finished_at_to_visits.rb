class AddFinishedAtToVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :finished_at, :datetime
  end
end
