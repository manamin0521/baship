json.array!(@spots) do |spot|
  json.extract! spot, :id, :name, :body
  json.url spot_url(spot, format: :json)
end
