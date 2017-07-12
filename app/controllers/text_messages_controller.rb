class TextMessagesController < ApplicationController
  include ApplicationHelper
  
  skip_before_action :verify_authenticity_token, :only => [:create]
  
  # If webhooks are set up as GET requests
  def index
    render json: { state: 200 }
  end
  
  # If webhooks are set up as POST requests
  def create
    render json: { state: 200 }
  end
end