class UsersController < ApplicationController
  before_filter :authenticate_user!, :defaults
  load_and_authorize_resource
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end
  
  def new
  end

  def edit
  end
  
  def show
  end
  
  def update
    @user.update_attributes(params[:user])
    @user.save
    flash[:success] = 'User updated successful.'
    redirect_to users_url
  end
  
  def create
    User.new(params[:user]).save
    flash[:success] = 'User added successful.'
    redirect_to users_url
  end
  
  def destroy
    @user.destroy
    flash[:success] = 'User deleted successful.'
    redirect_to users_url
  end
  
  def defaults
    @title = "Registered User"
  end
end