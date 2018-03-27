json.extract! phone_request, :id, :user_id, :chain_id, :response, :created_at, :updated_at

json.url phone_request_url(phone_request, format: :json)
