require 'spec_helper'

describe ProductsController do
  
  describe "app search auto options", :js => true do    
    extend DataFactory
    prepare_product_samples

    before(:each) do
      Product.fill_tag_cache(FakeProduct.dummy_search_by_name_example(characters_entered))
      expected_list = Tag.all
      StoreApi.should_receive(:search_tags_by_example).with(characters_entered).and_return(expected_list)

      visit('/products')
      fill_in 'token-input-lookup_options', :with => characters_entered
    end      

    context "with characters 'yel' entered in the seach field" do      
      it "shows app names that contain characters 'yel'" do
        within(".token-input-dropdown-facebook") do
          product_samples.each do |sample|
            page.should have_content(sample[:track_name].first(15).downcase) if sample[:track_name].downcase.include?(characters_entered)
          end          
        end
      end
    end

    context "with name 'yelp' selected in the list" do
      before(:each) do
        StoreApi.should_receive(:lookup_by_id).with(favorite_product.track_id).and_return(favorite_product)
      end      
      
      it "shows the icon of 'yelp' app" do
        sleep 1
        find("li:contains('yelp')").click

        within("div#product_details") do
          page.should have_css("img", :src => favorite_product.artwork_url_60)
        end
      end
    end

  end # "app search auto options"
end
