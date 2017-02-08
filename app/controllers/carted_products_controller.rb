class CartedProductsController < ApplicationController

  def index
   if current_user.carted_products.where(status: "carted").any?
     @carted_products = current_user.carted_products.where(status: "carted")
   else
    flash[:warning] = "No items in cart"
    redirect_to "/products"
   end
  end

  # create method copied from orders controller

  def create
    product_id = params[:product_id]
    quantity = params[:quantity]
    carted_product = CartedProduct.create(
     user_id: current_user.id,
     quantity: quantity,
     product_id: product_id,
     status: "carted"
     )
    
    flash[:success] = "Product added to cart!"
    redirect_to "/products"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    flash[:success] = "Product removed from cart"
    redirect_to "/carted_products"
  end
end
