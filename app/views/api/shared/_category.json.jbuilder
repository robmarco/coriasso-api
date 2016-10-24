json.extract! category, :id, :name, :description, :status
json.created_at category.created_at.to_s
json.updated_at category.updated_at.to_s

json.image do
  json.square_url category.image.url(:square)
  json.medium_url category.image.url(:medium)
  json.original_url category.image.url
end
