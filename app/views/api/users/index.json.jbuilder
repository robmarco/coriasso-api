json.pagination do
  json.partial! 'api/shared/pagination', resource: @users
end

json.data do
  json.array!(@users) do |user|
    json.partial! 'api/shared/user', user: user
  end
end
