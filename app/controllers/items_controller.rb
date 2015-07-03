class ItemsController < ApplicationController
  def create
    @item = Item.new(params[:id])
    @item.user = current_user

    if @item.save 
      flash[:notice] = "Item was saved"
      redirect_to @item
    else
      flash[:error] = "There was an error saving your item, please try again."
      redirect_to @item
    end

  end
end
