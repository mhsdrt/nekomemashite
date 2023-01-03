class Public::MembersController < ApplicationController
  def show
    @member = current_member
    @cats = @member.cats
  end
  
  def destroy

  end
  
  private
  
  def member_params
    params.require(:member).permit(:name)
  end
end
