class Public::HomesController < ApplicationController
  def top
    @items = Item.all.limit(8)
  end

  def about
  end
end
