require 'spec_helper'

describe StoreApi do

  before(:each) do
    @samples = [
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

  describe "app search" do
    it "should find an app by name" do
      app = StoreApi.search_by_name(@samples.first[:track_name]).first
      app.artwork_url_60.should == @samples.first[:artwork_url_60]
    end

    it "should find several apps by name example" do
      apps = StoreApi.search_by_name_example('yel')
      apps.each do |app|
        app.track_name.should =~ /yel/i
      end
    end

    it "should not return apps wich names are not matched with example" do
      apps = StoreApi.search_by_name_example('yel')
      apps.each do |app|
        @samples.each do |sample|
          sample[:track_name].should_not == app.track_name unless sample[:track_name] =~ /yel/i
        end
      end
    end
  end

  describe "app look up" do
    it "should look up an app by ID" do
      app = StoreApi.lookup_by_id(@samples.first[:track_id])
      app.track_name.should == @samples.first[:track_name]
      app.artwork_url_60.should == @samples.first[:artwork_url_60]
    end

    it "should return only the one app" do
      apps = StoreApi.lookup_by_id(@samples.first[:track_id])
      apps.respond_to?(:size).should_not be_true
    end
  end

end
