class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
  end
  
  def lookup
    @product = StoreApi.lookup_by_id(params[:lookup][:lookup_id])
    render 'index'    
  end
  
  def list
    sample = params[:q]
    render :json => StoreApi.search_tags_by_example(sample).map do |tag|
      { name: tag.name, id: tag.tag_id }
    end
  end

end
