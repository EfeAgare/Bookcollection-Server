# frozen_string_literal: true

class DeviseCreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
     ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## User Info
      t.string :first_name
      t.string :last_name
      t.datetime :birth_year
    
      t.timestamps null: false
    end

    add_index :authors, :email,                unique: true
    add_index :authors, :reset_password_token, unique: true
  end
end

