json.extract! user, :id, :email, :name, :sign_in_count
json.created_at user.created_at.to_s
json.updated_at user.updated_at.to_s
json.last_sign_in_at user.last_sign_in_at.to_s

json.image do
  json.square_url user.image.url(:square)
  json.medium_url user.image.url(:medium)
  json.original_url user.image.url
end
