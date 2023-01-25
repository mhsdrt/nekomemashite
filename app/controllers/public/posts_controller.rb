class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @cat = current_member.cats.all
  end
  
  def create
  @post = Post.new(post_params)
    @post.member_id = current_member.id
    @post.save
    redirect_to  public_posts_path
  
  end
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/public/posts'
  end
  


  private

  def post_params
    params.require(:post).permit(:cat_id, :member_id, :post_image, :content, :tag)
  end


end
