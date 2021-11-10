class Public::CartItemsController < ApplicationController
  def index
   @cart_items = CartItem.all

  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    puts "------------"
    p @cart_item
    puts "------------"
    if @cart_item.save!
      redirect_to cart_items_path
    end
  end


  def updated
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to cart_items_path
    end
  end

  def destroy_all
    @cart_items = CartItem.all
    if @cart_items.destroy_all
      redirect_to cart_items_path
    end
  end
 private

 def item_params
  params.require(:cart_item).permit(:amount)
 end

  def cart_item_params
  params.require(:cart_item).permit(:amount,:item_id,:customer_id)
  end

end
