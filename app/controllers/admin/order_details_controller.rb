class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = Order_detail.find(params[:id])
    if @order_detail.update(order_detail_params)
       redirect_to admin_order_path(@order_detail.id)
  end
end
