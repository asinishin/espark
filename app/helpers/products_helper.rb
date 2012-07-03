module ProductsHelper
  
  def test?
    ::Rails.env == 'test'
  end

end
