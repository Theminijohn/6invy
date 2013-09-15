json.array!(@albums) do |album|
  json.extract! album, :name
  json.url album_url(album, format: :json)
end
