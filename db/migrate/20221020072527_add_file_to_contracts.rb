class AddFileToContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :contract_file, :string
  end
end
