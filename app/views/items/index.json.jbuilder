json.array!(@items) do |item|
  json.extract! item, :id, :title, :description, :cover_image_url, :author_name, :audio_url, :feed_id
  json.url item_url(item, format: :json)
end
