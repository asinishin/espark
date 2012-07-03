class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
  end
  
  def lookup
    @product = StoreApi.lookup_by_name(params[:lookup][:options])
    render 'index'    
  end
  
  def list
    sample = params[:term]
    render :json => StoreApi.search_tags_by_example(sample).map { |tag| tag.name }    
  end

end
