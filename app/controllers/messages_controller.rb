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
  
  def get_mass_messages
  end
  
  def mass_messages
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    Listener.find_each do |listener|
      @client.messages.create(
        from: ENV["TWILIO_NUMBER"],
        to: listener.phone_number,
        body: params[:mass_message][:text]
      )
    end
    
    redirect_to root_path, notice: "Mass message successfully sent!"
  end

  private

  def clean_params
    params.require(:message).permit(:number, :text)
  end

end
