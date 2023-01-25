class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/admin_member_path'
  end
        private
    
    def post_params
      params.require(:post).
      permit(:content, :tag)
    end
end
