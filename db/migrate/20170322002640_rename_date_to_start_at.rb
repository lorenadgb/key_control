class RenameDateToStartAt < ActiveRecord::Migration[5.0]
  def change
    rename_column :visits, :date, :start_at
  end
end
