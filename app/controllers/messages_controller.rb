class MessagesController < ApplicationController
  include ApplicationHelper

  def index
     @messages = Message.order("created_at desc").where("inbound = true")
  end

  def show
    @messages = Message.for_number(params[:id])
    @new_message = Message.new(number: params[:id])
  end

  def create
    message = Message.new(clean_params)
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
