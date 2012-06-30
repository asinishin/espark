class StoreApi
  def self.search_by_name(app_name)
    Product.dummy_search_by_name(app_name)
  end
end
