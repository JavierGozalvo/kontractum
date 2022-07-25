class AddPostalcodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :postalcode, :string
  end
end
