When /^user submit an app name "(.*?)" for search$/ do |arg1|
  visit '/products'
  fill_in 'products_search', :with => arg1
end

Then /^he can see the result that contains tbe app name "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^contains the app icon "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
