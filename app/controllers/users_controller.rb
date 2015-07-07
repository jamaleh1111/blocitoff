class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.todos
  end
end
