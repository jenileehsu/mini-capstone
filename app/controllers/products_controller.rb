class ProductsController < ApplicationController

  def get_products
    
    @products = Product.all 
    render "products.html.erb"
  end

  def get_little_bee
    @little_bee = Product.first
    render "littlebee.html.erb"
  end


end
