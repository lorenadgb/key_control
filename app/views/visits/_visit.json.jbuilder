json.extract! visit, :id, :key, :key_id, :building, :building_id, :owner, :owner_id, :visitor, :visitor_id,
              :date, :observation, :created_at, :updated_at
json.url visit_url(visit, format: :json)
