require 'spec_helper'

describe StoreApi do

  before(:each) do
    @apps = [
      {
        track_id:       "456191378",
        track_name:     "forkly",
        artwork_url_60: "http://a2.mzstatic.com/us/r1000/116/Purple/v4/da/75/b8/da75b8b8-e070-e7c0-805f-10f5f37123a7/Icon.png"
        },
      {
        track_id:       "284945674",
        track_name:     "iWant",
        artwork_url_60: "http://a5.mzstatic.com/us/r1000/105/Purple/89/10/55/mzi.rszguyzr.png"
      }
    ]
  end

  describe "app search" do
    it "should find an app" do
      app = StoreApi.search_by_name(@apps.first[:track_name]).first
      app.artwork_url_60.should == @apps.first[:artwork_url_60]
    end

    it "should return only the one found app" do
      apps = StoreApi.search_by_name(@apps.first[:track_name])
      apps.size.should == 1
    end
  end

  describe "app look up" do
    it "should look up an app by ID" do
      app = StoreApi.lookup_by_id(@apps.first[:track_id])
      app.track_name.should == @apps.first[:track_name]
      app.artwork_url_60.should == @apps.first[:artwork_url_60]
    end

    it "should return only the one app" do
      apps = StoreApi.lookup_by_id(@apps.first[:track_id])
      apps.respond_to?(:size).should_not be_true
    end
  end

end
