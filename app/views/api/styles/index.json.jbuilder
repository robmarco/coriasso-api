json.pagination do
  json.partial! 'api/shared/pagination', resource: @styles
end

json.data do
  json.array!(@styles) do |style|
    json.partial! 'api/shared/style', style: style
  end
end
