json.array!(@clips) do |clip|
  json.extract! clip, :title
  json.url clip_url(clip, format: :json)
end
