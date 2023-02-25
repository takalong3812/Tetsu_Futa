class User::UsersController < ApplicationController
  before_action :move_to_signed_in, except: [:show]


  def show
  @user= User.find(params[:id])

  end

  def user_params
   params.require(:user).permit(:name, :introduction, :image, :is_deleted)
  end

end
