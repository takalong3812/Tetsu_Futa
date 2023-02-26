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

  def show
      @post= Post.find(params[:id])
      @user= @post.user
      @like= Like.new
      @comment= Comment.new
  end

  def destroy
     @post=Post.find(params[:id])
     if @post.destroy
      flash[:notice]= '投稿を削除しました'
      redirect_to user_user_path(current_user)
     else
      redirect_to user_post_path(@post.id)
     end
  end


   private

    def post_params
     params.require(:post).permit(:title, :impression, :image, :address, :user_id, tag_ids: [])
    end

end
