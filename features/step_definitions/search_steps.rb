Given /^the following app tags:$/ do |table|
  @app_tags = table.hashes
end

When /^user submitted an app name "(.*?)" for search$/ do |arg1|
  visit '/products'
  select  arg1.downcase,   :from => 'lookup_lookup_id'
#  fill_in 'search_app_name', :with => arg1

  VCR.use_cassette("app_lookup" + tag_id_by_name(@app_tags, arg1)) do
    click_button 'Search'
  end
end

Then /^he can see the result that contains the app name "(.*?)"$/ do |arg1|
  within("div#product_details") do
    page.should have_content(arg1)
  end
end

Then /^contains the app icon "(.*?)"$/ do |arg1|
  within("div#product_details") do
    page.should have_content(arg1)
  end
end

Then /^it should not contain other apps except of "(.*?)"$/ do |arg1|
  @app_tags.each do |tag|
    within("div#product_details") do
      page.should have_no_content(tag['Track Name']) unless tag['Track Name'] == arg1
    end
  end
end
