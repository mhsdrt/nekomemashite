class Public::HomesController < ApplicationController
  def top
       @posts = Post.all.page(params[:page]).per(5).order(created_at: :desc)
  end

end
