class AddAvatarToRealStateAgencies < ActiveRecord::Migration[5.0]
  def change
    add_column :real_state_agencies, :avatar, :string
  end
end
