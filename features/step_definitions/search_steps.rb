Given /^the following apps:$/ do |table|
  @apps = table.hashes
end

When /^user submitted an app name "(.*?)" for search$/ do |arg1|
  visit '/products'
  select  arg1.downcase,   :from => 'lookup_lookup_id'
#  fill_in 'search_app_name', :with => arg1
  click_button 'Search'
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
  @apps.each do |app|
    within("div#product_details") do
      page.should have_no_content(app['Track Name']) unless app['Track Name'] == arg1
    end
  end
end
