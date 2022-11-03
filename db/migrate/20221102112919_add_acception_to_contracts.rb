class AddAcceptionToContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :is_accepted, :boolean
  end
end
