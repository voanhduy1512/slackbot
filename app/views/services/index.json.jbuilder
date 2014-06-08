json.array!(@services) do |service|
  json.extract! service, :id, :title, :code, :sample_params
  json.url service_url(service, format: :json)
end
