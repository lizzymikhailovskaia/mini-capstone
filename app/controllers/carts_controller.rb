class CartsController < ApplicationController
  def index
    if current_user.carted_products.where(carted: "carted").any?
      @carted_products = current_user.carted_products.where(carted:"carted")
    else
      flash[:warning] = "You have no items in your cart!"
      redirect_to "/"
    end
  end

  def create
    product_id = params[:product_id]
    quantity = params[:quantity]
    carted_product = CartedProduct.create(
      user_id: current_user.id,
      quantity: quantity,
      product_id: product_id,
      carted: "carted"
    )
    flash[:success] = "CartedProduct successfully created"
    redirect_to "/products"

  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(carted:"removed")
     flash[:success] = "Your product removed!"
     redirect_to "/carted_products"
  end
end
