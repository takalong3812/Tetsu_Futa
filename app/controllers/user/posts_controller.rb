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


   private

    def post_params
     params.require(:post).permit(:title, :impression, :image, :address, :user_id, tag_ids: [])
    end

end
