class User::UsersController < ApplicationController
  before_action :move_to_signed_in, except: [:show]


  def show
  @user= User.find(params[:id])
  end

  def edit
   @user= User.find(params[:id])
    if @user == current_user
    else
     redirect_to user_user_path(current_user)
    end
  end

  def update
    @user= User.find(params[:id])
    if @user.update(user_params)
     flash[:notice]= 'You have updated user successfully'
     redirect_to user_user_path(current_user)
    else
      render:edit
    end
  end

  def unsubscribe
  @user= User.find(params[:id])
   if @user == current_user
   else
     redirect_to user_user_path(current_user)
   end
   if @user.email == 'guest@example.com'
   redirect_to user_user_path(current_user), notice: 'ゲストユーザーは退会できません'
   end
  end


 def withdrawal
  @user=current_user
  @user.update(is_deleted: true)
  reset_session
  flash[:notice]= "退会処理を実行しました"
  redirect_to root_path
 end

  private

  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  'user/users/sign_in'
    end
  end

  def user_params
   params.require(:user).permit(:name, :introduction, :image, :is_deleted)
  end

end
