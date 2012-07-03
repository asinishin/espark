Before do

  DatabaseCleaner.start
  Tag.clear_cache
end

After do |scenario|
  DatabaseCleaner.clean
end