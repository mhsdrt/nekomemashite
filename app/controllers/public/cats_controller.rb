class Public::CatsController < ApplicationController
  def new
    @cat = Cat.new
  end
  
  def create
    @cat = Cat.new(cat_params)
    @cat.member_id = current_member.id
    if@cat.save
    redirect_to  cats_path
    else
    render :new
    end
  end
  
  def edit
    @cat = Cat.find(params[:id])
  end
  
  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      flash[:notice] = "You have updated cat successfully."
    redirect_to cat_path
    else
      render :edit
    end
  end
  
  def index
    @member = current_member
    @cats = @member.cats
  end
  
  def show
    @cat = Cat.find(params[:id])
  end
  
  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to '/cats'
  end

  private

  def cat_params
    params.require(:cat).permit(:member_id, :cat_image, :name, :sex, :age, :cattype, :character, :profile)
  end

end