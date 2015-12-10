json.array!(@feeds) do |feed|
  json.extract! feed, :id, :name
  json.url feed_url(feed, format: :json)
end
