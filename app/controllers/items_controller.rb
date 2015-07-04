class ItemsController < ApplicationController
  def create
    @item = Item.new(params.require(:item).permit(:description))
    @item.current_user = @item

    if @item.save 
      flash[:notice] = "Item was saved"
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error saving your item, please try again."
      redirect_to user_path(current_user)
    end
  end
end
