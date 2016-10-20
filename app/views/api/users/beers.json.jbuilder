json.pagination do
  json.partial! 'api/shared/pagination', resource: @beers
end

json.data do
  json.user do
    json.partial! 'api/shared/user', user: @user
  end

  json.beers do
    json.array!(@beers) do |beer|
      json.partial! 'api/shared/beer', beer: beer
    end
  end
end
