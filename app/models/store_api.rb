class StoreApi
  def self.search_by_name(app_name)
    Product.dummy_search_by_name(app_name)
  end
  
  def self.lookup_by_id(app_id)
    Product.dummy_search_by_id(app_id)
  end
end
