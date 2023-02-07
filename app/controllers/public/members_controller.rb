class Public::MembersController < ApplicationController
  before_action :set_member, only: [:likes]
  
  def show
    @member = current_member
    @cats = @member.cats
  end
  
  def destroy
  end
  
  def likes
    likes = Like.where(member_id: @member.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end
  
  
  private
  
  def member_params
    params.require(:member).permit(:name, :id)
  end
  
  def set_member
    @member = Member.find(params[:id])
  end
  
end