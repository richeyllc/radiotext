class MessagesController < ApplicationController
  include ApplicationHelper

  def index
     @messages = Message.all
  end

  def show
    @messages = Message.for_number(params[:id])
    @new_message = Message.new(number: params[:id])
  end

  def create
    message = Message.new(clean_params)
    message.inbound = false

    if message.save
      redirect_to "/messages/#{message.number}"
    end
  end

  private

  def clean_params
    params.require(:message).permit(:number, :text)
  end
end
