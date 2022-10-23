class AddAvatarToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avatar, :string
    add_column :users, :about, :string
    add_column :users, :phone, :string
    add_column :users, :website, :string
  end
end
