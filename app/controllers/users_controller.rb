class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototype= Prototype.find(params[:id])
  end

end

