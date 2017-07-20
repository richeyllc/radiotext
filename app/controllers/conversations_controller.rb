class ConversationsController < ApplicationController
  def index
    session[:conversations] ||= []
    
    @conversations = Conversation.includes(:messages).find(session[:conversations])
  end
end