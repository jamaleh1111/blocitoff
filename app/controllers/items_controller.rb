class ItemsController < ApplicationController


  def create
    @user = User.find(params[:user_id])
    @item = @user.items
    @item = current_user.items.build(item_params)
    @item.user = current_user
    @item.user = @user
    @new_item = Item.new
    
    if @item.save 
      flash[:notice] = "Item was saved"
    else
      flash[:error] = "There was an error saving your item, please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "Item is completed!"
    else
      flash[:error] = "Sorry, there was a problem, please try again."
    end  

    respond_to do |format|
      format.html
      format.js
    end 
  end

  def item_params
    params.require(:item).permit(:name)
  end 
end
