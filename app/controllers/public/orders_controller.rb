class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def verification
    @orders = Order.all
  end

  def thanks

  end

  def create
    @order = Order.find(params[:id])
    if @order.save(order_params)
      redirect_to orders_thanks_path
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.find(params[:id])
  end
end
