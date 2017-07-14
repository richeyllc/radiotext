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
    
    # If SMS has competition keyword add user to competitors
    # competition = Competition.where("keyword like '?%' ", params[:Body])
    @competition = Competition.where("keyword like ?", "%#{params[:Body]}%").first
    @competition.competitors.create(phone_number: params[:From])
    
    # Send SMS to winner
    boot_twilio
    sms = @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: params[:From],
      body: "Hello! You're now registered as a competitor in the - #{@competition.title} - competition!"
    )
  end
  
  private
  
    def create_message(params)
      message = Message.create!(
        number: params[:From],
        text: params[:Body],
        inbound: true
      )
      
      send_cable(message)
      
      render json: { state: 200 }
    end
    
    def boot_twilio
      account_sid = ENV["TWILIO_ACCOUNT_SID"]
      auth_token = ENV["TWILIO_AUTH_TOKEN"]
      @client = Twilio::REST::Client.new account_sid, auth_token
    end
end