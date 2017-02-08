class OrdersController < ApplicationController

  before_action :authenticate_user!

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += (carted_product.product.subtotal * carted_product.quantity)
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    order = Order.create(user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)

    carted_products.update_all(status: "purchased", order_id: order.id)

    flash[:success] = "Order successfully placed!"
    redirect_to "/orders/:id"
  end

  def show
    order_id = params[:id]
    @order = Order.find_by(id: params[:id])
    if @order.user_id != current_user.id 
      redirect_to "/products"
    end
  end

end
