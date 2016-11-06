class PaymentGateway

  def self.pay(cc_number, security_code)
    chance = rand(100)
    return "rejected" if chance <= 10
    "accepted"
  end

end
