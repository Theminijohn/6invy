json.array!(@shows) do |show|
  json.extract! show, :name
  json.url show_url(show, format: :json)
end
