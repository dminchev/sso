class ClientsController < ApplicationController
  before_filter :authenticate_user!, :defaults
  load_and_authorize_resource
  
  def index
  end
  
  def new
  end

  def edit
  end
  
  def show
  end
  
  def update
    @client.update_attributes(params[:client])
    @client.save
    flash[:success] = 'Client updated successful.'
    redirect_to clients_url
  end
  
  def create
    @client = Client.new(params[:client])
    @client.key = @client.unique_key(16)
    @client.secret = @client.unique_key(24)
    @client.save
    flash[:success] = 'Client added successful.'
    redirect_to clients_url
  end
  
  def destroy
    @client.destroy
    flash[:success] = 'Client deleted successful.'
    redirect_to clients_url
  end
  
  def defaults
    @title = "Client Applications"
  end
end