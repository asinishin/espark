class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
  end
  
  def lookup
    begin
      @product = StoreApi.lookup_by_name(params[:lookup][:options])
    rescue => e
      flash.now[:alert] = e.message
      @product = nil
    end
    render 'index'    
  end
  
  def list
    sample = params[:term]
    render :json => StoreApi.search_tags_by_example(sample).map(&:name)
  end

end
