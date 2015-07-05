class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items
    @item = current_user.items.build(item_params)
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

  def destroy
    @user = User.find(params[:user_id])
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was removed."
    else
      flash[:error] = "Item could not be deleted.  Try again."
    end 
  end 

    resond_to do |format|
      format.html
      format.js
    end 


  def item_params
    params.require(:item).permit(:name)
  end 
end
