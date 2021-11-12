class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

    @addresses = current_customer.addresses
  end

  def verification
     @order = Order.new
     @order.payment_method = params[:order][:payment_method]

    if params[:order][:address_select] == "1"
      @order.address = current_customer.address
      @order.name = current_customer.fullname
      @order.postal_code = current_customer.postal_code

    elsif params[:order][:address_select] == "2"
      @select_address = Address.find(params[:order][:select_address])
      @order.address = @select_address.address
      @order.postal_code = @select_address.postal_code
      @order.name = @select_address.name

    elsif params[:order][:address_select] == "3"
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
      address = Address.new
      address.address = params[:order][:address]
      address.postal_code = params[:order][:postal_code]
      address.name = params[:order][:name]
      address.customer_id = current_customer.id
      address.save
    end
    @orders = Order.all
  end

  def thanks
  end

  def create
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.payment_method = @order.payment_method
    @order.postal_code = current_customer.postal_code
    @order.name = current_customer.fullname
    @order.shipping_cost = @order.shipping_cost
    @order.total_payment = @order.total_payment
    @order.status = @order.status
    @order.address = current_customer.address
    @order.save
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

private

  def order_params
    params.require(:order).permit(:customer_id,:payment_method,:postal_code,:name,:shipping_cost,:total_payment,:status,:address)
  end
end
