json.extract! category, :id, :name, :description, :status
json.created_at category.created_at.to_s
json.updated_at category.updated_at.to_s
