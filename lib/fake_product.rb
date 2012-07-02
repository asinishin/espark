# encoding: UTF-8
module FakeProduct
  
def self.build_dummies
  apps_data = [
    {
      trackId: '456191378',
      trackName: 'forkly',
      artworkUrl60: 'http://a2.mzstatic.com/us/r1000/116/Purple/v4/da/75/b8/da75b8b8-e070-e7c0-805f-10f5f37123a7/Icon.png',
      description: "Forkly is a beautiful way to share and discover tastes. We\u2019ll help you discover a new dish around the corner, the best burger in town or your favorite cocktail bar in a new city.\n\n★ Apple App Store Essentials for Foodies\n★ iPhone App of the Week in the UK (September 2011) \n★ New and Noteworthy in the US (February 2012) \n\nWith Forkly you can\u2026\n\n\u2022 See whats good at a particular restaurant or bar. \n\u2022 Discover tasty items and good restaurants by following others tastes.\n\u2022 \u201cWant\u201d items and easily find them later when you\u2019re hungry.\n\u2022 Share your tastes to Twitter, Facebook, Email and MMS.\n\u2022 Share photos of your food/drink and let others know where to find it. \n\u2022 Earn influence points, become a top influencer for places and items.\n\nLearn more: http://forkly.com"
    },
    {
      trackId: '284945674',
      trackName: 'iWant',
      artworkUrl60: 'http://a5.mzstatic.com/us/r1000/105/Purple/89/10/55/mzi.rszguyzr.png',
      description: "iWant is essentially the combination of 3 location based apps : Restaurant reviews (Yelp, UrbanSpoon), Movie showtimes (Flixter, Fandango) and Yellow Pages (Yellow Pages, AroundMe).  Why use iWant instead of these separate ones ? \n\n\u2022 iWant is faster, simpler and presents all this varied information in a clean and unified view.  It will help you reduce clutter on your home screen as it combines the functionality of several other apps.\n\n\u2022 Unlike typical Yellow Pages apps like AroundMe, iWant gives you restaurant reviews (instead of just a list of names) and movie times (rather than just a list of theaters near you) so that you can make an informed decision.\n\n\u2022 iWant has 3 pages of category icons, giving you one-tap access to over 30 categories.  Also, you can filter restaurants and nightlife with another two taps -- no typing required.\n\n\u2022 iWant can also show you nearby landmarks from Wikipedia (try the 'W' icon on the second page) so that you can use iWant like a virtual tour guide in a new city.\n\n\u2022 Use the settings icon (bottom left) to narrow or expand the search radius.  Use the map icon (bottom right) to see your results plotted on an interactive map.\n\nAs seen in : The Wall St. Journal (Walt Mossberg and Katherine Boehret), The NYTimes (Michelle Higgins) and WIRED magazine (Mathew Honan).\n\nPlease watch the instructional videos @ http://vimeo.com/iwant\n\nIf prefer not to see any ads, please consider purchasing iWant Pro."
    },
    {
      trackId: '449991112',
      trackName: 'YellowPages - Mobile Yellow Pages',
      artworkUrl60: 'http://a2.mzstatic.com/us/r1000/065/Purple/70/d3/10/mzi.watmijse.png',
      description: "Use YellowPages like you would the real yellow book or white pages listing. Search for nearby local businesses, restaurants, theaters, food and drink, nightlife, gas stations, cafes, bakeries, etc.\n\nNow with yellowpages rewards you can get the latest daily deals and discounts from premium deals companies like LivingSocial, BuyWithMe, or Groupon.\n\nYellowPages is the perfect companion to more complicated apps such as Yelp or iWant."
    },
    {
      trackId: '284910350',
      trackName: 'Yelp',
      artworkUrl60: 'http://a2.mzstatic.com/us/r1000/073/Purple/v4/ec/ba/57/ecba5736-8bf9-2f5f-fced-02d49ec15d41/57.png',
      description: "Looking for a burrito joint open now?  An Irish pub nearby?  A gas station you can drive to before your tank hits empty?  Yelp for your iPhone is here to help.  Use us to search for places to eat, shop, drink, relax and play then read reviews from an active community of locals in the know.   \n\nFEATURES:\n★ Search for businesses near you \n★ Tap quick links to find nearby bars, restaurants, cafes and more\n★ Narrow your searches by 'hood, distance, price, and what's open now\n★ Browse reviews to read what's great (and not so great) in your city\n★ Find great Deals offered by your favorite local businesses\n★ Add tips, photos, and draft reviews for your favorite businesses\n★ Check-in and share on Facebook and Twitter\n★ Make reservations on OpenTable without leaving the Yelp app\n★ Look up addresses and phone numbers for thousands of businesses, then call or map them from your iPhone\n★ Yelp does augmented reality with Monocle. Overlay business information onto the world around you."
    }
  ]
  apps_data = {
    resultCount: apps_data.size,
    results:     apps_data
  }
  apps_data.to_json
end

def self.dummy_search_by_name(track_name)
  apps = Product.build_from_json(build_dummies)
  apps.inject([]) { |result, app| app.track_name == track_name ? result << app : result }
end

def self.dummy_search_by_name_example(name_example)
  apps = Product.build_from_json(build_dummies)
  apps.inject([]) { |result, app| app.track_name.downcase.include?(name_example.downcase) ? result << app : result }
end

def self.dummy_search_by_id(track_id)
  apps = Product.build_from_json(build_dummies)
  apps.find { |app| app.track_id == track_id }
end

end