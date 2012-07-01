module DataFactory
  
  def prepare_product_samples
    let(:product_samples) do
      [
        {
          track_id:       "456191378",
          track_name:     "forkly",
          artwork_url_60: "http://a2.mzstatic.com/us/r1000/116/Purple/v4/da/75/b8/da75b8b8-e070-e7c0-805f-10f5f37123a7/Icon.png"
          },
        {
          track_id:       "284945674",
          track_name:     "iWant",
          artwork_url_60: "http://a5.mzstatic.com/us/r1000/105/Purple/89/10/55/mzi.rszguyzr.png"
          },
        {
          track_id:       "449991112",
          track_name:     "YellowPages - Mobile Yellow Pages",
          artwork_url_60: "http://a2.mzstatic.com/us/r1000/065/Purple/70/d3/10/mzi.watmijse.png"
          },
        {
          track_id:       "284910350",
          track_name:     "Yelp",
          artwork_url_60: "http://a2.mzstatic.com/us/r1000/073/Purple/v4/ec/ba/57/ecba5736-8bf9-2f5f-fced-02d49ec15d41/57.png"
        }
      ]
    end

    let(:characters_entered) { 'yel'}
    
    let(:expected_list) do
      Product.fill_tag_cache(Product.dummy_search_by_name_example(characters_entered))
    end
  end

end
