json.array!(@neighbours) do |neighbour|
  json.extract! neighbour, :id, :name
  json.url neighbour_url(neighbour, format: :json)
end
