class DataExample

  attr_reader :styles, :categories, :beers, :variants, :users, :ratings

  def initialize
    @styles = []
    @categories = []
    @beers = []
    @variants = []
    @users = []
    @ratings = []
  end

  def call
    create_styles
    create_beers
    create_variants
    create_categories
    create_users
    create_ratings
  end

  private

    def create_styles
      beer_styles = [
        { name: "Black & Tan", description: "This applies to pre-blended packaged beers, where a brewery will blend a dark ale with a light ale or lager. It's by no means a traditional style of beer, but rather brewers capitalizing on the concept practiced at bars where the beers are physically layered." },
        { name: "Belgian IPA", description: "Inspired by the American India Pale Ale (IPA) and Double IPA, more and more Belgian brewers are brewing hoppy pale colored ales for the US market (like Chouffe & Urthel), and there's been an increase of Belgian IPAs being brewed by American brewers. Generally, Belgian IPAs are considered too hoppy by Belgian beer drinkers." },
        { name: "Lambic - Fruit", description: "In the case of Fruit Lambics, whole fruits are traditionally added after spontaneous fermentation has started. Kriek (cherries), Frambroise (raspberries), Peach (peach) and Cassis (black currant) are common fruits, all producing subtle to intense fruit characters respectively. Once the fruit is added, the beer is subjected to additional maturation before bottling. Malt and hop characters are generally low to allow the fruit to consume the palate. Alcohol content tends to be low." },
        { name: "Light Lager", description: "The Light Lager is generally a lighter version of a breweries premium lager, some are lower in alcohol but all are lower in calories and carbohydrates compared to other beers. Typically a high amount of cereal adjuncts like rice or corn are used to help lighten the beer as much as possible. Very low in malt flavor with a light and dry body. The hop character is low and should only balance with no signs of flavor or aroma. European versions are about half the alcohol (2.5-3.5% abv) as their regular beer yet show more flavor (some use 100% malt) then the American counterparts. For the most part this style has the least amount of flavor than any other style of beer." },
        { name: "American IPA", description: "The American IPA is a different soul from the reincarnated IPA style. More flavorful than the withering English IPA, color can range from very pale golden to reddish amber. Hops are typically American with a big herbal and / or citric character, bitterness is high as well. Moderate to medium bodied with a balancing malt backbone." }
      ]

      beer_styles.each do |beer_style|
        style_created = Style.create! name: beer_style[:name], description: beer_style[:description]
        @styles << style_created
      end
    end

    def create_beers
      beer_list = [
        { name: "Yuengling Black & Tan", origin: "Pennsylvania, USA", abv: 4.70, description: "No notes at this time.", style: @styles[0] },
        { name: "Grazias Induresca", origin: "California, USA", abv: 6.50, description: "No notes at this time.", style: @styles[0] },
        { name: "Winter IPA", origin: "Belgium", abv: 8.50, description: "No notes at this time.", style: @styles[0] },
        { name: "Black Knight", origin: "California, USA", abv: 6.40, description: "No notes at this time.", style: @styles[0] },
        { name: "A Little Sumpin' Wild", origin: "California, USA", abv: 8.80, description: "Fermented with the Westmalle yeast strain", style: @styles[1] },
        { name: "Whiplash White IPA", origin: "Georgia, USA", abv: 6.30, description: "What happens when a 500year old Belgian style ale gets rear-ended by a truckload of pompous American hops? It equals one heck of an ambulance chaser of a beer. This is an American style Belgian IPA, with a subtle phenolic ﬂavor in combination with citrusy/piney hops, well balanced at 6.2% and 55 IBUs, with a tart, dry ﬁnish. 2014 World Beer Cup Bronze Medal winner for American-Belgo-Style Ale category.", style: @styles[1] },
        { name: "Electric India", origin: "Scotland", abv: 6.50, description: "One day. One brewery. Seven thousand co-creators. Two hundred brewers. The result? Electric India. This beer is the bastard love child of the craft beer revolution. An unholy union between a Belgian Saison and an India Pale Ale; democratically brewed by our very own Equity for Punks shareholders.", style: @styles[1] },
        { name: "Anosteke", origin: "France", abv: 8.00, description: "Anosteké Blonde beer is a beer decidedly hoppy Flanders giving it a bitterness and a length incomparable mouth. The Anosteké Blonde has been awarded the gold medal at the Concours Général Agricole 2011. Anosteké = tot anoste keer expression of meaning in us to the next", style: @styles[1] },
        { name: "Cantillon Fou' Foune", origin: "Belgium", abv: 5.0, description: "Apricot Lambic", style: @styles[2] },
        { name: "Lindemans Framboise", origin: "Belgium", abv: 2.50, description: "2.5-4.0% ABV", style: @styles[2] },
        { name: "Cantillon Kriek 100% Lambic", origin: "Belgium", abv: 5.0, description: "No notes at this time.", style: @styles[2] },
        { name: "Raspberry Lambic", origin: "Indiana, USA", abv: 5.00, description: "No notes at this time.", style: @styles[2] },
        { name: "Bud Light", origin: "Missouri, USA", abv: 4.25, description: "Bud Light is brewed using a blend of premium aroma hop varieties, both American-grown and imported, and a combination of barley malts and rice. Its superior drinkability and refreshing flavor makes it the world’s favorite light beer.", style: @styles[3] },
        { name: "Amstel Light ", origin: "Netherlands", abv: 3.50, description: "No notes at this time.", style: @styles[3] },
        { name: "Budweiser Select ", origin: "Missouri, USA", abv: 4.30, description: "Brewed with two-row and roasted caramel malt for a rich color, and a blend of hand-selected premium American and Bavarian hops for balance and flavor. Budweiser Select spends approximately twice as long as regular beers in the brewhouse, which results in lower carbohydrate and calorie content after fermentation.", style: @styles[3] },
        { name: "Miller 64", origin: "Wisconsin, USA", abv: 2.80, description: "No notes at this time.", style: @styles[3] },
        { name: "60 Minute IPA", origin: "Delaware, USA", abv: 6.0, description: "60 Minute IPA is continuously hopped -- more than 60 hop additions over a 60-minute boil. (Getting a vibe of where the name came from?)", style: @styles[4] },
        { name: "Jai Alai IPA", origin: "Florida, USA", abv: 7.50, description: "Pours copper in color with notes of citrus and tropical fruit in the aroma. Flavor has upfront citrus bitterness with a hint of caramel and citrus and tropical fruit hop notes in the finish.", style: @styles[4] },
        { name: "Big Eye IPA", origin: "California, USA", abv: 7.00, description: "No notes at this time.", style: @styles[4] },
        { name: "Nelson", origin: "California, USA", abv: 7.00, description: "A Golden Rye IPA - An outstanding hop from New Zealand, Nelson Sauvin, is generously used throughout the brewing and dry-hopping of this unique beer. European rye is added for a smooth, malty addition to flavor. 1.065 OG 7% AB", style: @styles[4] },
      ]

      beer_list.each do |b|
        created_beer = Beer.create! name: b[:name], origin: b[:origin], abv: b[:abv], description: b[:description], style: b[:style]
        @beers << created_beer
      end
    end

    def create_variants
      @beers.each do |beer|
        Variant.create! size: "33cl", price: 150, beer: beer
        Variant.create! size: "50cl", price: 210, beer: beer
        Variant.create! size: "75cl", price: 300, beer: beer
      end
    end

    def create_categories
      wild_west = Category.create! name: "Wild West America", description: ""
      ids = [0, 1, 3, 4, 5, 11, 12, 14, 15, 16, 17, 18, 19]
      ids.each do |i|
        wild_west.beers << @beers[i]
      end
      european = Category.create! name: "Loving Europe", description: ""
      ids = [2, 6, 7, 8, 9, 10, 13]
      ids.each do |i|
        european.beers << @beers[i]
      end
    end

    def create_users
    end

    def create_ratings
    end

end
