class OrdersController < ApplicationController
  before_action :authenticate_customer!
  def index
    if admin_signed_in?
      @orders = Order.all.order(created_at: :desc).includes(:customer)
    else
      @orders = current_customer.orders.order(created_at: :desc).includes(:customer)
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
