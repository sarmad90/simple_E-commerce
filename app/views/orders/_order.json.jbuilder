json.extract! order, :id, :order_no, :total, :date, :created_at, :updated_at
json.url order_url(order, format: :json)
