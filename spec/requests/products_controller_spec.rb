require 'spec_helper'

describe "ProductsController" do
  
  describe "app search auto options", :js => true do    

    prepare_product_samples

    before(:each) do
      visit('/products')
      fill_in 'token-input-lookup_options', :with => characters_entered
      StoreApi.should_receive(:search_tags_by_example).with(characters_entered).and_return(expected_list)
    end      

    context "with characters 'yel' entered in the seach field" do      
      it "shows app names that contain characters 'yel'" do
        within(".token-input-dropdown-facebook") do
          product_samples.each do |sample|
            page.should have_content(sample[:track_name].first(15).downcase) if sample[:track_name] =~ /yel/i
          end          
        end
      end
    end

    context "with name 'yelp' selected in the list" do
      before(:each) do
        StoreApi.should_receive(:lookup_by_id).with(product_samples.last[:track_id]).and_return(Product.new(product_samples.last))
      end      
      
      it "shows the icon of 'yelp' app" do
        sleep 1
        find("li:contains('yelp')").click

        within("div#product_details") do
          page.should have_css("img", :src => product_samples.last[:artwork_url_60])
        end
      end
    end

  end # "app search auto options"
end
