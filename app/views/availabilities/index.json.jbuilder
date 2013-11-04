json.array!(@availabilities) do |availability|
  json.extract! availability, 
  json.url availability_url(availability, format: :json)
end
