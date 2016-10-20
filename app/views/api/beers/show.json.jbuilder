json.data do
  json.partial! 'api/shared/beer', beer: @beer
  json.variants do
    json.array!(@beer.variants) do |variant|
      json.partial! 'api/shared/variant', variant: variant
    end
  end
end
