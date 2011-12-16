class TokensController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :user
  
  def create   
    @user.reset_authentication_token!
    redirect_to edit_user_registration_path(@user)
  end
  
  def destroy
    @user.authentication_token = nil
    @user.save
    redirect_to edit_user_registration_path(@user)
  end
end