class ProductsController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show, :search]

# code for 7 dwarves goes here (best practice)

  def index
    if session[:count] == nil
      session[:count] = 0
    end
    session[:count] += 1
    @visit_count = session[:count]
    
    @products = Product.all 
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end

    if params[:sort]
      @products = Product.all.order(params[:sort] => params[:sort_order])
    end
    
    if params[:discount]
      @products = Product.where("price < ?", 2)
    end 

    render "index.html.erb"
  end

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{search_term}%")
    render :index
  end

  def new
    @product = Product.new  
  end

  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      image: params[:image], 
      description: params[:description])

    if @product.save
      flash[:success] = "Product successfully created!"
      redirect_to "/products/#{product.id}"
    else
      render :new
    end
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @supplier = @product.supplier
    @images = @product.images
    if product_id == "random"
      @product = Product.all.sample
    end
    render "show.html.erb"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def update
    unless is_admin?
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
      @product.update(name: params[:name], description: params[:description], price: params[:price], image: params[:image])
      flash[:success] = "Product successfully added!"
      redirect_to "/products/#{@product.id}"
    end
  end

  def destroy
    unless is_admin?
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
      @product.destroy
      flash[:warning] = "Product successfully deleted!"
      redirect_to "/products"
    end
  end

end
