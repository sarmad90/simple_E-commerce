class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_lines, dependent: :destroy

  def self.new_number
    last_order = Order.last
    return "SEC-Order#1" unless last_order
    "SEC-Order##{last_order.id + 1}"
  end

  def customer_name
    "#{customer.firstname} #{customer.lastname}"
  end
end
