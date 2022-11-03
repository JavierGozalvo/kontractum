class AddDefaultValueToIsAcceptedAttribute < ActiveRecord::Migration[7.0]
  def change
    change_column :contracts, :is_accepted, :boolean, default: false
  end
end
