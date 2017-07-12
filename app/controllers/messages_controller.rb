class MessagesController < ApplicationController
  include ApplicationHelper
  
  def index
    @messages = Message.recent_by_number.by_date
  end
  
  def show
    @messages = Message.for_number(params[:id])
    @new_message = Message.new(number: params[:id])
  end
end