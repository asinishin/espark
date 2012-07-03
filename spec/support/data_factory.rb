module DataFactory
  
  def prepare_product_samples
    let(:product_samples) do
      fake_products = Product.build_from_json(FakeProduct.build_dummies)
      fake_products.map { |p| p.attributes }
    end

    let(:characters_entered) {'yel'}
    
    let(:favorite_product) { Product.new(product_samples.last) }
  end

end
