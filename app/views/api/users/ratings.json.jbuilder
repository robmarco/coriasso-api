json.pagination do
  json.partial! 'api/shared/pagination', resource: @ratings
end

json.data do
  json.user do
    json.partial! 'api/shared/user', user: @user
  end

  json.ratings do
    json.array!(@ratings) do |rating|
      json.partial! 'api/shared/rating', rating: rating
    end
  end
end
