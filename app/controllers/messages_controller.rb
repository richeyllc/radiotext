class MessagesController < ApplicationController
  include ApplicationHelper
  
  def index
    @messages = Message.recent_by_number.by_date
  end
  
  def show
    @messages = Message.for_number(params[:id])
    @new_message = Message.new(number: params[:id])
  end
  
  def create
    message = Message.new(message_params)
    message.inbound = false
    
    if message.save
      redirect_to "/messages/#{message.number}"
    end
  end
  
  private
  
    def message_params
      params.require(:message).permit(:number, :text)
    end
end