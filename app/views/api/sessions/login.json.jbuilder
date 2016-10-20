json.data do
  json.partial! 'api/shared/user', user: @user
  json.token @token.token
end
