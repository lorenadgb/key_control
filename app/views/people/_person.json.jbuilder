json.extract! person, :id, :name, :email, :number, :fax, :created_at, :updated_at
json.url person_url(person, format: :json)