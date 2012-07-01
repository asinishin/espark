require 'spec_helper'

describe StoreApi do
  extend DataFactory

  prepare_product_samples

  describe "app search" do
    it "should find several app tags by name example" do
      tags = StoreApi.search_tags_by_example(characters_entered)
      tags.each do |tag|
        tag.name.include?(characters_entered).should be_true
      end
    end

    it "should not return app tags wich names are not matched with example" do
      tags = StoreApi.search_tags_by_example(characters_entered)
      tags.each do |tag|
        product_samples.each do |sample|
          sample[:track_name].should_not == tag.name unless sample[:track_name].include?(characters_entered)
        end
      end
    end
  end

  describe "app look up" do
    use_vcr_cassette

    it "should look up an app by ID" do
      app = StoreApi.lookup_by_id(product_samples.last[:track_id])
      app.track_name.should     == product_samples.last[:track_name]
      app.artwork_url_60.should == product_samples.last[:artwork_url_60]
    end

    it "should return only the one app" do
      apps = StoreApi.lookup_by_id(product_samples.last[:track_id])
      apps.respond_to?(:size).should_not be_true
    end
  end

end
