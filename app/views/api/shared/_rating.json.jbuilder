json.extract! rating, :id, :rate
json.created_at rating.created_at.to_s

json.beer do
  json.partial! 'api/shared/beer', beer: rating.beer
end
