json.data do
  json.style do
    json.partial! 'api/shared/style', style: @style
  end
end
