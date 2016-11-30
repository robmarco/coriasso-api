class BeersFinder < BaseFinder

  model Beer

  def all
    scope.includes(:style).all
  end

  def query(options={})
    featured  = options.fetch(:featured, false)
    this_week = options.fetch(:this_week, false)

    beers = all
    beers = beers.featured  if featured
    beers = beers.this_week if this_week
    beers
  end

end
