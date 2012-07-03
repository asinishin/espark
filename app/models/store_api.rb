require 'net/http'
require 'fake_product'

class StoreApi
  def self.lookup_by_id(app_id)
    uri = URI.parse("http://itunes.apple.com/lookup?id=#{app_id}")
    json = Net::HTTP.get(uri)
    Product.build_from_json(json).first
  end
  
  def self.search_tags_by_example(name_example, asynchr_cache_mode=true)
    if name_example.nil? || name_example.empty?
      []
    else
      rs = Tag.search_by_example(name_example).first(8)
      if rs.size == 0
        fill_cache(name_example, asynchr_cache_mode)
        rs = Tag.search_by_example(name_example) unless asynchr_cache_mode
      end
      rs
    end
  end

  def self.fill_cache(failed_name_example, asynchr_cache_mode)
    # The fetching data from real store is yet not implemented, so I fake it
    #   unless asynchr_cache_mode
    #  fake_products = FakeProduct.dummy_search_by_name_example(failed_name_example)
    #  Product.fill_tag_cache(fake_products)
    #   end
    batch = Batch.create(:example => failed_name_example)
    if asynchr_cache_mode
      batch.delay.load
    else
      batch.load
    end
  end
  
  def self.clear_cache
    Tag.clear_cache
  end
end
