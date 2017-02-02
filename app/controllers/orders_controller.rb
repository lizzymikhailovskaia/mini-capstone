class OrdersController < ApplicationController
  def create
    product_id = params[:product_id]
    product = Product.find_by(id:product_id)
    quantity = params[:quantity]
    order = Order.create(
      user_id: current_user.id,
      quantity: quantity,
      product_id: product_id,
      subtotal: (product.price * quantity.to_f),
      tax: (product.tax * quantity.to_f),
      total: (product.total * quantity.to_f)
    )

    flash[:message] = "Your order has been successfully created!"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
