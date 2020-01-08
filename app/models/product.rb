class Product < ApplicationRecord
	has_many :product_variants
  validates_uniqueness_of :sku
end
