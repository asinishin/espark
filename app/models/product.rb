class Product
  attr_accessor :track_id, :track_name, :artwork_url_60
  
  def initialize(attrs=nil)
    super()
    unless attrs.nil?
      @track_id       = attrs[:track_id]
      @track_name     = attrs[:track_name]
      @artwork_url_60 = attrs[:artwork_url_60]
    end
  end
  
  def attributes
    { 
      track_id: @track_id,
      track_name: @track_name,
      artwork_url_60: @artwork_url_60
    }
  end

  def self.fill_tag_cache(products)
    Tag.cache_tags(products) do |product|
      { tag_id: product.track_id, name: product.track_name }
    end
    Tag.all
  end

  def self.build_from_json(json)
    apps_data = JSON.parse(json)
    unless apps_data['resultCount'].nil?
      apps_data = apps_data['results']
      apps_data.map do |attrs|
        self.new(
          track_id:       attrs['trackId'],
          track_name:     attrs['trackName'],
          artwork_url_60: attrs['artworkUrl60']
        )
      end
    else
      []
    end
  end
  
end
