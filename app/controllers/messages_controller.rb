class MessagesController < ApplicationController
  include ApplicationHelper
  
  def index
    @messages = Message.recent_by_number.by_date
  end
end