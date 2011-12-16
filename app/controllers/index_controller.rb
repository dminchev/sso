class IndexController < ApplicationController
  before_filter :authenticate_user!, :except => :home
  
  def home
  end
  
  def me 
    @user = current_user
  end
end