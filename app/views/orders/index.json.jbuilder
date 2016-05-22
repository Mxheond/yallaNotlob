json.array!(@orders) do |order|
  json.extract! order, :id, :order_for, :restaurant, :status
  json.url order_url(order, format: :json)
end
