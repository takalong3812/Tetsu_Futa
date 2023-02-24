class User::UsersController < ApplicationController
  before_action :move_to_signed_in, except: [:show]


  def show
  @user= User.find(params[:id])
  @posts= @user.posts
  @post= Post.new
  end

end
