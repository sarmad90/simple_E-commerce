class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :authenticate_admin!

  def index
    @customers = Customer.customers
  end
end
