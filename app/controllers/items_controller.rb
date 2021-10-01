class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new()
  end

  def create
    @item = Item.create
  end



  private

  def item_params
    params.require(:item).permit(:image)
  end
end