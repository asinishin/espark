Given /^the following apps:$/ do |table|
  @app_names = table.hashes
end

When /^user submitted an app name "(.*?)" for search$/ do |arg1|
  visit '/products'
  fill_in 'search_app_name', :with => arg1
  click_button 'Search'
end

Then /^he can see the result that contains tbe app name "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^contains the app icon "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^it should not contain other apps except of "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
