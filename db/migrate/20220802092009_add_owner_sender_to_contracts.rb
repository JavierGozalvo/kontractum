class AddOwnerSenderToContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :owner, :integer
    add_column :contracts, :beneficiary, :integer
    add_foreign_key :contracts, :users, column: :owner, primary_key: :id
    add_foreign_key :contracts, :users, column: :beneficiary, primary_key: :id
    remove_column :contracts, :user_id, :integer
  end
end
