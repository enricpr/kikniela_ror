class AddEmailPasswordToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :email, :string
    add_column :sessions, :password, :string
  end
end
