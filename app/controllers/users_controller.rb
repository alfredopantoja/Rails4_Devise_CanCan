class UsersController < ApplicationController
  before_filter :authenticate_user!, 
                only: [:index, :destroy, :following, :followers]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end  

  def destroy
    authorize! :destroy, @user, message: 'Not authorized as an administrator'
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end  

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end  

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end  
end  
