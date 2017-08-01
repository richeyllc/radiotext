class MessagesController < ApplicationController
  include ApplicationHelper

  def index
    @listeners = Listener.all
    @conversations = Conversation.includes(:messages)
  end

  def show
    @listener = Listener.where(phone_number: params[:id]).first
    @conversation = Conversation.where(sender_id: @listener.id).first
    
    @messages = @conversation.messages.for_number(params[:id]).order("created_at DESC")
    @new_message = @conversation.messages.new(number: params[:id])
  end

  def create
    @listener = Listener.where(phone_number: params[:message][:number]).first
    @conversation = Conversation.where(sender_id: @listener.id).first
    
    message = @conversation.messages.new(clean_params)
    message.inbound = false

    if message.save
      send_cable(message)
      send_sms(message)
    end
  end

  private

  def clean_params
    params.require(:message).permit(:number, :text)
  end

end
