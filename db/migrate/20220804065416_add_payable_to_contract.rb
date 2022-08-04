class AddPayableToContract < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :payable, :boolean, null: false, default: false
  end
end
