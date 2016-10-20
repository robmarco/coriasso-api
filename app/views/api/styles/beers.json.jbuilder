json.pagination do
  json.partial! 'api/shared/pagination', resource: @beers
end

json.data do
  json.style do
    json.partial! 'api/shared/style', style: @style
  end
  
  json.beers do
    json.array!(@beers) do |beer|
      json.partial! 'api/shared/beer', beer: beer
    end
  end
end
