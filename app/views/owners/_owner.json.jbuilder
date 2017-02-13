json.extract! owner, :id, :name, :email, :number, :fax, :created_at, :updated_at
json.url owner_url(owner, format: :json)