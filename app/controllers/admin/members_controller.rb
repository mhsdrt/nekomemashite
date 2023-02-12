class Admin::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @cats = @member.cats
    @posts = @member.posts
  end
  
  def index
    @members = Member.all
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path
    else
      render :edit
    end
  end

  private
    
  def member_params
    params.require(:member).permit(:email, :name, :is_deleted)
  end
end
