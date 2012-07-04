module ProductsHelper
  
  def test?
    ::Rails.env == 'test'
  end
  
  def no_pics?
     @product.screenshot_urls.nil? || \
     @product.screenshot_urls.empty? || test?
  end

end
