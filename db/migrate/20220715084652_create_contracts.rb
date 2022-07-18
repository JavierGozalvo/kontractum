class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.string :title
      t.text :desc
      t.string :owner
      t.string :kind
      t.integer :status

      t.timestamps
    end
  end
end
