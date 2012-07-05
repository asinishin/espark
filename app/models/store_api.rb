require 'net/http'

class StoreApi
  def self.api_request(uri)
    Net::HTTP.get(uri)
  rescue => e
    Rails.logger.error(e.class.name + ':' + e.message)
    e.backtrace.each { |line| Rails.logger.error line }
    raise "Cannot connect to the store server!"
  end

  def self.lookup_by_id(app_id)
    uri = URI.parse(Espark::Application.config.api_lookup_url + "?id=#{app_id}")
    json = api_request(uri)
    Product.build_from_json(json).first
  end

  def self.lookup_by_name(app_name)
    tag = Tag.find_by_name(app_name)
    lookup_by_id(tag.tag_id) unless tag.nil?
  end

  def self.search_by_example(name_example)
    term = URI.escape(name_example)
    uri = URI.parse(Espark::Application.config.api_search_url + "?country=us&entity=software&term=#{term}")
    json = api_request(uri)
    Product.build_from_json(json)
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
    batch = Batch.create(example: failed_name_example)
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
