json.pagination do
  json.partial! 'api/shared/pagination', resource: @categories
end

json.data do
  json.array!(@categories) do |category|
    json.partial! 'api/shared/category', category: category
  end
end
