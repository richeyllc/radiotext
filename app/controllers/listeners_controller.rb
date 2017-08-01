class ListenersController < ApplicationController
  before_action :set_listener, only: [:edit, :update]
   
  def edit
  end
  
  def update
    if @listener.update(listener_params)
      redirect_to "/messages/#{@listener.phone_number}", notice: 'Successfully updated listener!'
    else
     render :edit, notice: 'There was an error processing your request!'
    end
  end
  
  private
    def set_listener
      @listener = Listener.find(params[:id])
    end
    
    def listener_params
      params.require(:listener).permit(:name, :email, :address, :city, :state, :zip_code, :age, :date_of_birth, :notes)
    end
end