class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.boolean :status, default: false, null: false

      t.timestamps null: false
    end
  end
end
