require 'spec_helper'

describe StoreApi do
  extend DataFactory
  prepare_product_samples

  describe "app search" do
    before(:each) do
      Product.fill_tag_cache(product_samples.map{ |p| Product.new(p) })
      @tags = StoreApi.search_tags_by_example(characters_entered)
    end

    it "should find several app tags by name example" do
      @tags.size.should_not == 0
      @tags.each do |tag|
        tag.name.include?(characters_entered).should be_true
      end
    end

    it "should not return app tags wich names are not matched with example" do
      @tags.size.should_not == 0
      @tags.each do |tag|
        product_samples.each do |sample|
          sample[:track_name].should_not == tag.name unless sample[:track_name].include?(characters_entered)
        end
      end
    end
  end

  describe "app look up" do
    use_vcr_cassette

    before(:each) do
      @app = StoreApi.lookup_by_id(favorite_product.track_id)
    end

    it "should look up an app by ID" do
      @app.track_name.should == favorite_product.track_name
      @app.artwork_url_60.should == favorite_product.artwork_url_60
    end

    it "should return only the one app" do
      @app.respond_to?(:size).should_not be_true
    end
  end

end
