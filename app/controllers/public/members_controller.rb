class Public::MembersController < ApplicationController
  before_action :set_member, only: [:likes]
  
  def show
    @member = current_member
    @cats = @member.cats
    @posts = @member.posts
  end
  
  def index
  end
  
  def destroy
  end
  
  def likes
    likes = Like.where(member_id: @member.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end
  
  def withdraw
    current_member.update(is_deleted: true,)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def member_params
    params.require(:member).permit(:name, :id)
  end
  
  def set_member
    @member = Member.find(params[:id])
  end
  
end