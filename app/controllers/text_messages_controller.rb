class TextMessagesController < ApplicationController
  include ApplicationHelper
  
  skip_before_action :verify_authenticity_token, :only => [:create]
  
  # If webhooks are set up as GET requests
  def index
    create_message(params)
  end
  
  # If webhooks are set up as POST requests
  def create
    create_message(params)
  end
  
  private
  
    def create_message(params)
      boot_twillio
      
      sms = @client.messages.create(
        from: ENV["TWILIO_NUMBER"],
        to: params("from_number"),
        body: params("text")
      )
      render json: { state: 200 }
    end
    
    def boot_twillio
      account_sid = ENV["TWILIO_ACCOUNT_SID"]
      auth_token = ENV["TWILIO_AUTH_TOKEN"]
      @client = Twilio::REST::Client.new account_sid, auth_token
    end
end