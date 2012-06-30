Before do
  #FakeWeb.clean_registry

  DatabaseCleaner.start
end

After do |scenario|
  DatabaseCleaner.clean
end