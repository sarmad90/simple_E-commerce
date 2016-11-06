class CartController < ApplicationController
  before_action :authenticate_customer!
  def index
    @products = Product.where(id: session[:cart])
  end

  def checkout

  end

  def place_order
    status = PaymentGateway.pay(params[:cc_number], params[:cc_security_code])
    if status == "accepted"
      @order = Order.create!(customer: current_customer, order_no: Order.new_number, total: total_price_of_cart,
        date: Time.zone.now)
      products = Product.where(id: cart)
      cart.uniq.each do |cart_item|
        unit_price = products.find(cart_item).price
        total_price = unit_price * cart.count(cart_item)
        @order.order_lines.create!(qty: cart.count(cart_item), unit_price: unit_price,
          total_price: total_price, product_id: cart_item)
      end
      empty_cart
      redirect_to products_path, notice: "Thank you for payment. Your order has been placed."
    else
      redirect_to checkout_path, alert: "The payment was not successful. Please check your credit card number, security code and then try again."
    end
  end

end
