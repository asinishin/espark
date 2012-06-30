class Product
  attr_accessor :track_id, :track_name, :artwork_url_60
  
  def initialize(json=nil)
    super()
    unless json.nil?
      attrs = JSON.parse(json)
      @track_id = attrs['trackId']
      @track_name = attrs['trackName']
      @artwork_url_60 = attrs['artworkUrl60']
    end
  end

  def self.dummy_search_by_name(track_name)
    apps = []
    apps << new({
      trackId: '456191378',
      trackName: 'forkly',
      artworkUrl60: 'http://a2.mzstatic.com/us/r1000/116/Purple/v4/da/75/b8/da75b8b8-e070-e7c0-805f-10f5f37123a7/Icon.png'
    }.to_json)
    apps << new({
      trackId: '284945674',
      trackName: 'iWant',
      artworkUrl60: 'http://a5.mzstatic.com/us/r1000/105/Purple/89/10/55/mzi.rszguyzr.png'
    }.to_json)
    apps.inject([]) { |result, app| app.track_name == track_name ? result << app : result }
  end

end
