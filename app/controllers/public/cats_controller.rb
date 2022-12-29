class Public::CatsController < ApplicationController
  def new
    @cat = Cat.new
  end
  
  def create
      # 投稿データの保存
  @cat = Cat.new(cat_params)
    @cat.member_id = current_member.id
    @cat.save
    redirect_to  public_cats_path
  
  end
  
  def index
    @cats = Cat.all
  end
  
  def show
    @cat = Cat.find(params[:id])
  end
  
  def destroy
  end

  private

  def cat_params
    params.require(:cat).permit(:image, :name, :sex, :age, :cattype, :character, :profile)
  end

end