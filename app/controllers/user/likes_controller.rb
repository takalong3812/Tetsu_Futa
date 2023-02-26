class User::LikesController < ApplicationController

  def create
      #@like= Like.new(user_id: current_user.id, post_id: params[:post_id])
      @post = Post.find(params[:post_id])
      @like = current_user.likes.new(post_id: @post.id)
      @like.save
      redirect_to user_post_path(@post.id)
  end

  def destroy
      #@like= Like.find_by(user_id: current_user.id,post_id: params[:post_id])
      @post = Post.find(params[:post_id])
      @like = current_user.likes.find_by(post_id: @post.id)
      @like.destroy
       redirect_to user_post_path(@post.id)
  end

end
