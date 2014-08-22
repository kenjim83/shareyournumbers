json.array!(@distributors) do |distributor|
  json.extract! distributor, :id, :name, :website, :logo_url, :address, :city, :state, :zip
  json.url distributor_url(distributor, format: :json)
end
