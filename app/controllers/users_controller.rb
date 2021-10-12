class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      bypass_sign_in(@user) 
      redirect_to root_path
    else
      render :edit
    end
  end
  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end
end
