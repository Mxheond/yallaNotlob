json.array!(@notifications) do |notification|
  json.extract! notification, :id, :from_id, :to_id, :order_id_id
  json.url notification_url(notification, format: :json)
end
