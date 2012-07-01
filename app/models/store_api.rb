require 'net/http'
require 'fake_product'

class StoreApi
  def self.lookup_by_id(app_id)
    uri = URI.parse("http://itunes.apple.com/lookup?id=#{app_id}")
    json = Net::HTTP.get(uri)
    Product.build_from_json(json).first
  end
  
  def self.search_tags_by_example(name_example)
    sync_cache

    if name_example.nil? || name_example.empty?
      Tag.all
    else
      Tag.search_by_example(name_example)
    end
  end

  def self.sync_cache
    if Tag.cache_outdated?
      # The fetching data from real store is yet not implemented, so I fake it
      fake_products = Product.build_from_json(FakeProduct.build_dummies)

      Product.fill_tag_cache(fake_products)
    end
  end
end
