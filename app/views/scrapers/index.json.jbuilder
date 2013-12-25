json.array!(@scrapers) do |scraper|
  json.extract! scraper, :id, :first_name, :last_name, :title, :name, :location, :industry, :picture, :skills, :organizations, :education, :websites, :groups, :languages, :certifications
  json.url scraper_url(scraper, format: :json)
end
