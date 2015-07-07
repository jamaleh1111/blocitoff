class ItemsController < ApplicationController


  def create
    @item = current_user.items.build(item_params)
    #@new_item = Item.new
    
    if @item.save 
      flash[:notice] = "Item was saved"
      redirect_to current_user
    else
      flash[:error] = "There was an error saving your item, please try again."
      redirect_to current_user
    end

    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def destroy
    
    @item = current_user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item is completed!"
      redirect_to current_user
    else
      flash[:error] = "Sorry, there was a problem, please try again."
      redirect_to current_user
    end  

    # respond_to do |format|
    #   format.html
    #   format.js
    # end 
  end

  def item_params
    params.require(:item).permit(:name)
  end 
end
