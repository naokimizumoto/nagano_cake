class Public::CartItemsController < ApplicationController
  def index
   @cart_items = Cartitem.all
  end

　def create
　  @item = Item.find(params{:id})
　  if @item.save(item_params)
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
      redirect_to cart_items_patj
    end
  end
private

def item_params
  params.require(:cart_item).permit(:amount)
end

def cart_item_params
  params.require(:cart_item).permit(:amount)
end

end
