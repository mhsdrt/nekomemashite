class Public::LikesController < ApplicationController
  before_action :authenticate_member!, only: [:create, :destroy]
  before_action :post_params, only: [:create, :destroy]

  
  
  def create
    Like.create(member_id: current_member.id, post_id: @post.id)
  end
  
  def destroy
    like = Like.find_by(member_id: current_member.id, post_id: @post.id)
    like.destroy
  end
  
  private
  
  def post_params
    @post = Post.find(params[:post_id])
  end
  
end
