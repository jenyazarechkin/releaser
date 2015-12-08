json.array!(@releases) do |release|
  json.extract! release, :id, :name, :released_at
  json.url release_url(release, format: :json)
end
