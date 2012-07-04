class Product
  attr_accessor :track_id, :track_name, :artwork_url_60, :description, :screenshot_urls
  
  def initialize(attrs=nil)
    super()
    unless attrs.nil?
      @track_id        = attrs[:track_id]
      @track_name      = attrs[:track_name]
      @artwork_url_60  = attrs[:artwork_url_60]
      @description     = attrs[:description]
      @screenshot_urls = attrs[:screenshot_urls]
    end
  end
  
  def attributes
    { 
      track_id: @track_id,
      track_name: @track_name,
      artwork_url_60: @artwork_url_60,
      description: @description,
      screenshot_urls: @screenshot_urls
    }
  end

  def self.fill_tag_cache(products)
    products.each do |product|
      tg = Tag.find_the_tag(product.track_id, product.track_name)
      Tag.create({ tag_id: product.track_id, name: product.track_name }) if tg.nil?
    end
  end
  
  def self.build_from_json(json)
    apps_data = JSON.parse(json)
    unless apps_data['resultCount'].nil?
      apps_data = apps_data['results']
      apps_data.map do |attrs|
        new(
          track_id:        attrs['trackId'],
          track_name:      attrs['trackName'],
          artwork_url_60:  attrs['artworkUrl60'],
          description:     attrs['description'],
          screenshot_urls: attrs['screenshotUrls']
        )
      end
    else
      []
    end
  end
  
end
