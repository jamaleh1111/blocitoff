class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items
    @item = Item.new(params.require(:item).permit(:description))
    # @item.user = current_user
    # @item.user = @user
    

    if @item.save 
      flash[:notice] = "Item was saved"
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error saving your item, please try again."
      redirect_to user_path(current_user)
    end
  end
end
