class ProductsController < ApplicationController

# code for 7 dwarves goes here (best practice)

  def index
    @products = Product.all 
    if params[:sort]
      @products = Product.all.order(params[:sort] => params[:sort_order])
    end
    
    if params[:discount]
      @products = Product.where("price < ?", 2)
    end 

    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    product = Product.create(
      name: params[:name],
      price: params[:price],
      image: params[:image], 
      description: params[:description])
    flash[:success] = "Product successfully created!"
    redirect_to "/products/#{product.id}"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    if product_id == "random"
      @product = Product.all.sample
    end
    render "show.html.erb"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end

  def update
   product_id = params[:id]
   @product = Product.find_by(id: product_id)
   @product.update(name: params[:name], description: params[:description], price: params[:price], image: params[:image])
   flash[:success] = "Product successfully added!"
   redirect_to "/products/#{@product.id}"
  end

  def destroy
     product_id = params[:id]
     @product = Product.find_by(id: product_id)
     @product.destroy
     flash[:warning] = "Product successfully deleted!"
     redirect_to "/products"
  end

end
