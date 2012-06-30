class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
  end
  
  def search
    @product = StoreApi.search_by_name(params[:search][:app_name]).first
    render 'index'    
  end

end
