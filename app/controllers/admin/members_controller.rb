class Admin::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @cats = @member.cats
    @posts = @member.posts
  end
  
  def index
    @members = Member.all
  end


  private
    
  def member_params
    params.require(:member).permit(:email, :name, :is_deleted)
  end
end
