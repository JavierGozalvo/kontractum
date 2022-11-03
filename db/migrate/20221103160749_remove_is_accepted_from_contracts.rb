class RemoveIsAcceptedFromContracts < ActiveRecord::Migration[7.0]
  def change
    remove_column :contracts, :is_accepted, :boolean
  end
end
