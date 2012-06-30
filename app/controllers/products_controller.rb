class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
  end
  
  def lookup
    @product = StoreApi.lookup_by_id(params[:lookup][:lookup_id])
    render 'index'    
  end

end
