json.array!(@steps) do |step|
  json.extract! step, :id, :name, :status
  json.url step_url(step, format: :json)
end
