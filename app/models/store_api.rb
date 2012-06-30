require 'net/http'

class StoreApi
  def self.search_by_name(app_name)
    Product.dummy_search_by_name(app_name)
  end
  
  def self.search_by_name_example(name_example)
    Product.dummy_search_by_name_example(name_example)
  end

  def self.lookup_by_id(app_id)
#    Product.dummy_search_by_id(app_id)
    uri = URI.parse("http://itunes.apple.com/lookup?id=#{app_id}")
    json = Net::HTTP.get(uri)
    Product.build_from_json(json).first
  end
end
