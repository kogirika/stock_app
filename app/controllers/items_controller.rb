class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :index
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:name, :stock, :price, :category_id).merge(user_id: current_user.id)
  end


end
