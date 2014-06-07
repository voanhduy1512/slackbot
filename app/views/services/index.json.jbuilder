json.array!(@services) do |service|
  json.extract! service, :id, :title, :code
  json.url service_url(service, format: :json)
end
