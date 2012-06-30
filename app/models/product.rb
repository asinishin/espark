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

  def self.build_dummies
    apps_data = [
      {
        trackId: '456191378',
        trackName: 'forkly',
        artworkUrl60: 'http://a2.mzstatic.com/us/r1000/116/Purple/v4/da/75/b8/da75b8b8-e070-e7c0-805f-10f5f37123a7/Icon.png'
      },
      {
        trackId: '284945674',
        trackName: 'iWant',
        artworkUrl60: 'http://a5.mzstatic.com/us/r1000/105/Purple/89/10/55/mzi.rszguyzr.png'
      },
      {
        trackId: '449991112',
        trackName: 'YellowPages - Mobile Yellow Pages',
        artworkUrl60: 'http://a2.mzstatic.com/us/r1000/065/Purple/70/d3/10/mzi.watmijse.png'
      },
      {
        trackId: '284910350',
        trackName: 'Yelp',
        artworkUrl60: 'http://a2.mzstatic.com/us/r1000/073/Purple/v4/ec/ba/57/ecba5736-8bf9-2f5f-fced-02d49ec15d41/57.png'
      }
    ]
    apps_data = {
      resultCount: apps_data.size,
      results:     apps_data
    }
    build_from_json(apps_data.to_json)
#    apps_data.to_json
  end

  def self.dummy_search_by_name(track_name)
    apps = build_dummies
    apps.inject([]) { |result, app| app.track_name == track_name ? result << app : result }
  end

  def self.dummy_search_by_name_example(name_example)
    apps = build_dummies
    apps.inject([]) { |result, app| app.track_name.downcase =~ /name_example.downcase/ ? result << app : result }
  end

  def self.dummy_search_by_id(track_id)
    apps = build_dummies    
    apps.find { |app| app.track_id == track_id }
  end

end
