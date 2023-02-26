class User::PostsController < ApplicationController

  def create
     @post= Post.new(post_params)
     @post.user_id= current_user.id
      if @post.save
      flash[:notice]= '投稿に成功しました'
      redirect_to user_post_path(@post.id)
      else
       @posts= Post.all
       @user= current_user
       render :index
      end
  end

end
