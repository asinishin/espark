module ProductsHelper
  
  def test?
    ::Rails.env == 'test'
  end

  def search_options
    StoreApi.search_tags_by_example(nil).map { |tag| [tag.name, tag.tag_id] }
  end
end
