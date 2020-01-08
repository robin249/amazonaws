class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :sku, index: true, unique: true
      t.string :product_family
      t.jsonb :product_attributes, default: {}
      t.boolean :isactive, default: true

      t.timestamps
    end
  end
end
