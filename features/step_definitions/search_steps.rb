Given /^the following app tags:$/ do |table|
  @app_tags = table.hashes

  #Full fill the tag cache with given samples
  @app_tags.each do |tag|
    VCR.use_cassette("app_search" + tag['Track ID']) do    
      StoreApi.search_tags_by_example(tag['Track Name'], false)
    end
  end
end

When /^user submitted an app name "(.*?)" for search$/ do |arg1|
  visit '/products'
  fill_in 'lookup_options', with: arg1.first(3).downcase
  VCR.use_cassette("app_lookup" + tag_id_by_name(@app_tags, arg1)) do
    sleep 1
    page.execute_script("$(\"a.ui-corner-all:contains('#{arg1.downcase}')\").mouseover().click();")

    # When your cassets are empty you should increase the wait time
    sleep 2
  end
end

Then /^he can see the result that contains the app name "(.*?)"$/ do |arg1|
  within("div.product-header") do
    page.should have_content(arg1)
  end
end

Then /^contains the app icon "(.*?)"$/ do |arg1|
  within("div.product-header") do
#    page.should have_content(arg1)
    page.should have_css("img", src: arg1)
  end
end

Then /^it should not contain other apps except of "(.*?)"$/ do |arg1|
  @app_tags.each do |tag|
    within("div.product-header") do
      page.should have_no_content(tag['Track Name']) unless tag['Track Name'] == arg1
    end
  end
end
