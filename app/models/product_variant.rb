class ProductVariant < ApplicationRecord
	belongs_to :product
  validates_uniqueness_of :rate_code
end
