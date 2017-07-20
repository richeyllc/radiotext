class ConversationsController < ApplicationController
  def index
    session[:conversations] ||= []
    
    @listeners = Listener.all
    @conversations = Conversation.includes(:messages).find(session[:conversations])
  end
  
  def create
    @conversation = Conversation.all.order('created_at DESC')
    
    add_to_conversations unless conversated?
    
    respond_to do |format|
      format.js
    end
  end
  
  private
    
    def add_to_conversations
      session[:conversations] ||= []
      session[:conversations] << @conversation.id
    end
    
    def conversated?
      session[:conversations].include?(@conversation.id)
    end
end