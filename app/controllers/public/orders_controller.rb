class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def verification

     @order = Order.new(order_params)
     @order.shipping_cost = 800
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
    @sum=0
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      @sum+=(cart_item.item.price*cart_item.amount)
    end
    @sum+=800
    @order.total_payment=@sum
  end

  def thanks
  end

  def create

    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    current_customer.cart_items.each do |cart_item|
      order_detail = order.order_details.new
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.price*1.1
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path

    #@order.payment_method = @order.payment_method
    #@order.postal_code = current_customer.postal_code
    #@order.name = current_customer.fullname
   # @order.shipping_cost = @order.shipping_cost
    #@order.total_payment = @order.total_payment
    #@order.status = @order.status
    #@order.address = current_customer.address
    #@order.save
    #if @order.save(order_params)
     # redirect_to orders_thanks_path

  end

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details

  end

private

  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:name,:total_payment,:address,:shipping_cost)
  end
end