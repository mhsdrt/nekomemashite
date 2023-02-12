class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/admin/members'
  end
        private
    
    def post_params
      params.require(:post).
      permit(:content, :tag)
    end
end
