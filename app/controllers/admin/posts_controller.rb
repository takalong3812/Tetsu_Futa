class Admin::PostsController < ApplicationController

  def show
   @post= Post.find(params[:id])
   @user= @post.user
  end


  def destroy
     @post=Post.find(params[:id])
     if @post.destroy
      flash[:notice]= '投稿を削除しました'
      redirect_to admin_users_path
     else
      redirect_to admin_post_path(@post.id)
     end
  end



  private

    def post_params
     params.require(:post).permit(:title, :impression, :image, :address, :user_id, tag_ids: [])
    end

end
