class Product < ActiveRecord::Base
  def self.total_price_of_products(ids)
    products = Product.where(id: ids)
    total_price = 0
    products.each do |product|
      count = ids.count(product.id)
      total_price += product.price * count
    end
    total_price
  end
end
