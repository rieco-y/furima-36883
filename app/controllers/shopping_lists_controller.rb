class ShoppingListsController < ApplicationController
  before_action :set_item
  before_action :sold_out
  before_action :authenticate_user!


  def index
    @shopping_list_address_list = ShoppingListAddressList.new
  end

  def create
    @shopping_list_address_list = ShoppingListAddressList.new(shopping_list_params)
    if @shopping_list_address_list.valid?
      pay_item
      @shopping_list_address_list.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shopping_list_params
    # params.permit(:user_id, :item_id, :post_num, :todouhuken_id, :city, :house_num, :building_name, :tel_num, :shopping_list_id, :token).merge(user_id: current_user.id)
    params.require(:shopping_list_address_list).permit(:user_id, :item_id, :post_num, :todouhuken_id, :city, :house_num, :building_name, :tel_num, :shopping_list_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: shopping_list_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold_out
    unless current_user != @item.user && @item.shopping_list.blank?
      redirect_to root_path
    end 
  end
  
end
