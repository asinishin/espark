require 'net/http'

class StoreApi
  def self.lookup_by_id(app_id)
#    Product.dummy_search_by_id(app_id)
    uri = URI.parse("http://itunes.apple.com/lookup?id=#{app_id}")
    json = Net::HTTP.get(uri)
    Product.build_from_json(json).first
  end
  
  def self.search_tags_by_example(name_example)
    Product.fill_tag_cache(Product.build_dummies) if Tag.cache_outdated?
    if name_example.nil? || name_example.empty?
      Tag.all
    else
      Tag.search_by_example(name_example)
    end
  end
end
