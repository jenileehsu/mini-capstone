class ProductsController < ApplicationController

  def index
    @products = Product.all 
    render "index.html.erb"
  end

  def show
    products_id = params[:id]
    @product = Product.find_by(id: products_id)
    render = "show.html.erb"
  end

  def get_little_bee
    @little_bee = Product.first
    render "littlebee.html.erb"
  end

end
