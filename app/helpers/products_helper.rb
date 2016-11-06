module ProductsHelper
  def product_status(status)
    status ? "Enabled" : "Disabled"
  end

  def product_in_cart?(product)
    cart.include?(product.id)
  end
end
