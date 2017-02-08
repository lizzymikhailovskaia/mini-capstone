class OrdersController < ApplicationController

    before_action :authenticate_user!
    #user_id, #subtotal, #tax, #total
    def create
      carted_products = current_user.carted_products.where(carted: "carted")

      order = Order.create(user_id: current_user.id)

      carted_products.update_all(carted: "purchased", order_id: order.id)

      order.calculate_totals

      flash[:success] = "Order successfully created"
      redirect_to "/orders/#{order.id}"
    end

    def show
      @order = Order.find_by(id: params[:id])
      if @order.user_id != current_user.id
        redirect_to '/'
      end
    end
  end
