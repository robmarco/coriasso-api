json.extract! beer, :id, :name, :origin, :abv, :description
json.created_at beer.updated_at.to_s
json.updated_at beer.updated_at.to_s

json.style do
  json.partial! 'api/shared/style', style: beer.style
end

json.image do
  json.square_url beer.image.url(:square)
  json.medium_url beer.image.url(:medium)
  json.original_url beer.image.url
end
