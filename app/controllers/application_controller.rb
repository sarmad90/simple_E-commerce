class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def cart
    return session[:cart] = [] unless session[:cart]
    session[:cart]
  end
  helper_method :cart

  def total_price_of_cart
    Product.total_price_of_products(cart)
  end
  helper_method :total_price_of_cart

  def empty_cart
    session[:cart] = []
  end
  helper_method :empty_cart

  def admin_signed_in?
    customer_signed_in? && current_customer.admin
  end
  helper_method :admin_signed_in?

  def authenticate_admin!
    return true if admin_signed_in?
    redirect_to root_path, alert: "You don't have access to this page."
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])
  end
end
