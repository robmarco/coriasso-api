json.extract! variant, :id, :size, :price, :status
json.created_at variant.updated_at.to_s
json.updated_at variant.updated_at.to_s
