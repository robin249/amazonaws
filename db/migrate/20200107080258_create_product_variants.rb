class CreateProductVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variants do |t|
      t.references :product, index: true, foreign_key: true
      t.string :rate_code
      t.string :region, index: true
      t.text :description
      t.string :begin_range
      t.string :end_range
      t.string :unit
      t.decimal :price, precision: 12, scale: 2
      t.string :currency
      t.datetime :effective_date

      t.timestamps
    end
  end
end
