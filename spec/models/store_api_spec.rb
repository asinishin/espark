require 'spec_helper'

describe StoreApi do

  describe "app search" do
    before(:each) do
      @apps = [
        {
          track_name:     "forkly",
          artwork_url_60: "http://a2.mzstatic.com/us/r1000/116/Purple/v4/da/75/b8/da75b8b8-e070-e7c0-805f-10f5f37123a7/Icon.png"
        },
        {
          track_name:     "iWant",
          artwork_url_60: "http://a5.mzstatic.com/us/r1000/105/Purple/89/10/55/mzi.rszguyzr.png"
        }
      ]
    end

    it "should find an app" do
      app = StoreApi.search_by_name(@apps.first[:track_name]).first
      app.artwork_url_60.should == @apps.first[:artwork_url_60]
    end

    it "should return only the one found app" do
      apps = StoreApi.search_by_name(@apps.first[:track_name])
      apps.size.should == 1
    end
  end

end
