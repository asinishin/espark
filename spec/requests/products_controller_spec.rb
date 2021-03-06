require 'spec_helper'

describe ProductsController do
  
  describe "app search auto options", js: true do    
    extend DataFactory
    prepare_product_samples

    before(:each) do
      Product.fill_tag_cache(FakeProduct.dummy_search_by_name_example(characters_entered))
      expected_list = Tag.all
      StoreApi.should_receive(:search_tags_by_example).with(characters_entered).and_return(expected_list)

      visit('/products')
      fill_in 'lookup_options', with: characters_entered
    end      

    context "with characters 'yel' entered in the seach field" do      
      it "shows app names that contain characters 'yel'" do
        within("ul.ui-autocomplete") do
          product_samples.each do |sample|
            if sample[:track_name].downcase.index(characters_entered) == 0
              page.should have_content(Tag.normalize_name(sample[:track_name]))
            end
          end          
        end
      end
    end

    context "with name 'yelp' selected in the list" do
      before(:each) do
        StoreApi.should_receive(:lookup_by_name).with(favorite_product.track_name.downcase).and_return(favorite_product)
      end      
      
      it "shows the icon of 'yelp' app" do
        sleep 1
        page.execute_script("$(\"a.ui-corner-all:contains('yelp')\").mouseover().click();")

        within("div#product_details") do
          page.should have_css("img[alt='#{ favorite_product.artwork_url_60 }']")
        end
      end
    end

  end # "app search auto options"
end
