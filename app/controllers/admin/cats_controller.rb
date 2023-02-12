class Admin::CatsController < ApplicationController
  def show
    @cat = Cat.find(params[:id])
  end
  
  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to '/admin/members'
  end
  
end
