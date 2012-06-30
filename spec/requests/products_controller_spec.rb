require 'spec_helper'

describe ProductsController do
  
  describe "app search auto options", :js => true do    
    let!(:samples) do
      samples = [
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

    context "with characters 'yel' entered in the seach field" do
      before(:each) do
        visit('/products')
        fill_in 'token-input-lookup_options', :with => 'yel'
      end      
      
      it "shows app names that contain characters 'yel'" do
        within(".token-input-dropdown-facebook") do
          samples.each do |sample|
            page.should have_content(sample[:track_name].first(15).downcase) if sample[:track_name] =~ /yel/i
          end          
        end
      end
    end

    context "with name 'yelp' selected in the list" do
      use_vcr_cassette

      before(:each) do
        visit('/products')
        fill_in 'token-input-lookup_options', :with => 'yel'
        sleep 1
        find("li:contains('yelp')").click
      end      
      
      it "shows the icon of 'yelp' app" do
        within("product_details") do
          page.should have_content(samples[3][:artwork_url_60])
        end
      end
    end
  end 

end
