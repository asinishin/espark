module DataFactory
  
  def prepare_product_samples
    let(:product_samples) do
      fake_products = Product.build_from_json(FakeProduct.build_dummies)
      fake_products.map { |p| p.attributes }
    end

    let(:characters_entered) { 'yel'}
    
    let(:expected_list) do
      Product.fill_tag_cache(FakeProduct.dummy_search_by_name_example(characters_entered))
    end
  end

end
