class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.boolean :display_blank_codes, default: true
      t.integer :keychain_height
      t.integer :keychain_width

      t.references :real_state_agency

      t.timestamps
    end
  end
end
