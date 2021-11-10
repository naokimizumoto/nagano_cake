class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
    @addresses = Address.all
  end

  def verification #ifの分岐
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
