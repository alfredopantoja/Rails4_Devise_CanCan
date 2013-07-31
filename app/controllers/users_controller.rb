class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end  

  def destroy
    authorize! :destroy, @user, message: 'Not authorized as an administrator'
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end  
end  
