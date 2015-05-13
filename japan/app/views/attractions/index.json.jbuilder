json.array!(@attractions) do |attraction|
  json.extract! attraction, :id, :tag, :name, :description, :address, :opening_hour, :duration, :reservation, :more_info, :picture, :url
  json.url attraction_url(attraction, format: :json)
end
