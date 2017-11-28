json.extract! parking_event, :id, :parkrequest, :parkallowed, :parkcompleted, :getbikerequest, :getbikecompleted, :created_at, :updated_at
json.url parking_event_url(parking_event, format: :json)
