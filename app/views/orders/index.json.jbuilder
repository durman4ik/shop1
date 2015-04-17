json.array!(@orders) do |order|
  json.extract! order, :id, :first_name,, :last_name,, :address, :city,, :zip_code,, :phone,, :email,, :pay_type,, :delivery_type
  json.url order_url(order, format: :json)
end
