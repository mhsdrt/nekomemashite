class Public::PostsController < ApplicationController
  before_action :authenticate_member!
  def new
    @post = Post.new

  end
  
  def create
  @post = Post.new(post_params)
    @post.member_id = current_member.id
    if@post.save
    redirect_to  posts_path
    else
    render :new
    end
  end
  
  def index
       @posts = Post.all.order(created_at: :desc)

       
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts'
  end
  


  private

  def post_params
    params.require(:post).permit(:cat_id, :member_id, :post_image, :content, :tag)
  end


end
