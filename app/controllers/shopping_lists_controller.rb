class ShoppingListsController < ApplicationController

  def index
    @shopping_list_address_list = ShoppingListAddressList.new(shopping_list_address_list_params)
  end

  def create
    
    @shopping_list_address_list = ShoppingListAddressList.new(shopping_list_address_list_params)
    if @shopping_list_address_list.valid?
      @shopping_list_address_list.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def shopping_list_address_list_params  
      params.require(:shopping_list_address_list).permit(:post_num, :todouhuken_id, :city, :house_num, :building_name, :tel_num,).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
