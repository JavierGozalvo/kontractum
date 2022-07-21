class RemoveOwnerFromContracts < ActiveRecord::Migration[7.0]
  def change
    remove_column :contracts, :owner, :string
  end
end
