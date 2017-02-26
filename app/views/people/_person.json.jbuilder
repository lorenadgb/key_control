json.extract! person, :id, :name, :email, :number, :fax, :personable_type, :created_at, :updated_at
json.url person_url(person, format: :json)
