class ShoppingListsController < ApplicationController

  def index
    @shopping_list_address_list = ShoppingListAddressList.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @shopping_list_address_list = ShoppingListAddressList.new(shopping_list_params)
    if @shopping_list_address_list.valid?
      @shopping_list_address_list.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def shopping_list_params
    params.permit(:user_id, :item_id, :post_num, :todouhuken_id, :city, :house_num, :building_name, :tel_num, :shopping_list_id, :token).merge(user_id: current_user.id)
  end
  
end
