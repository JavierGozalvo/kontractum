class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :doc_id
      t.integer :doc_kind
      t.string :email
      t.string :birthdate

      t.timestamps
    end
  end
end
